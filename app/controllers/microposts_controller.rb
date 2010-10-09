class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  
  def destroy
    if @micropost.destroy
      flash[:success] = "Micropost deleted!"
      redirect_back_or root_path
    end
  end
  
  private
  def authenticate
     deny_access unless signed_in?
   end
   
   def authorized_user
     @micropost = Micropost.find(params[:id])
     redirect_to root_path unless current_user?(@micropost.user)
   end
end
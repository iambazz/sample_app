class MicropostsController < ApplicationController
  respond_to :html, :xml, :js
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def my_comments
    @feed_items = current_user.microposts.paginate(:page => params[:page])
  end
  
  def create
    @story = Story.find(session[:story_id]) unless session[:story_id].nil?
    @micropost = current_user.microposts.build(params[:micropost])
    @micropost.story_id = @story.id
    if @micropost.save
      #respond_with @micropost
      #flash[:success] = "Micropost created!"
      #
      respond_to do |format|
        format.html { redirect_to stories_path + '/' + @story.id.to_s }
        format.js
      end
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  
  def destroy
    if @micropost.destroy
      #@story = Story.find(session[:story_id])
      #flash[:success] = "Micropost deleted!"
      respond_to do |format|
        format.html { redirect_to stories_path + '/' + session[:story_id].to_s }
        format.js
      end
      
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
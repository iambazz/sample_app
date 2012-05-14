class StoriesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :destroy, :my_stories]
  in_place_edit_for :title, :content
  
  def index
    @stories = Story.all.paginate(:page => params[:page])
  end
  
  def set_story_title
    @story = Story.find(params[:id])
    @story.title = params[:value]
    @story.save
  end
  
  def my_stories
    @story = current_user.stories.all
  end
  
  def create
    @story = current_user.stories.build(params[:story])
    if params[:photo_rights] != '1' && @story.photo?
      flash[:error] = "You need to have the rights to the image!!"
      render 'pages/home'
    else
      if @story.save
        flash[:success] = "You wrote a story!"
        redirect_to "#{stories_path}/#{@story.id.to_s}"
      else
        render 'pages/home'
      end
    end 
  end
  
  def edit
    @story = Story.find(params[:id])
  end
  
  def update
    @story = Story.find(params[:id])
    if params[:photo_rights] != '1' && @story.photo?
      flash[:error] = "You need to have the rights to the image!!"
      render 'edit'
    else
      if @story.update_attributes(params[:story])
        flash[:success] = "Story updated."
        redirect_to @story
      else
        @title = "Edit story"
        render 'edit'
      end
    end
  end
  
  def new
    @story = Story.new
  end
  
  def show
    @reply = false
    @story = Story.find(params[:id])
    @micropost = Micropost.new
    @feed_items = @story.microposts.paginate(:page => params[:page])
    session[:story_id] = params[:id]
  end
  
  def destroy
    @story = Story.find(params[:id])
    @story.microposts.each do |m|
      m.destroy
    end
    #@story.update_attribute(:photo, nil)
    if @story.destroy
      #flash[:success] = "Story deleted!"
      #redirect_back_or root_path
      respond_to do |format|
        format.html { redirect_back_or root_path }
        format.js
      end
    end
  end
end

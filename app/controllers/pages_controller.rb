class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
  
  def posts
    @title = "Post"
    if signed_in?
      @micropost = Micropost.new
    else
      @feed_items = Micropost.all
    end
  end
end

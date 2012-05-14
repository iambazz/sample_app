class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :story
  
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  validates :story_id, :presence => true
  
  default_scope :order => 'microposts.created_at DESC'
end

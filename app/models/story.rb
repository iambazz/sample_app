class Story < ActiveRecord::Base
  # Paperclip
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small => "521x246>" }
      
  attr_accessible :content, :country, :time, :title, :mood, :photo
  
  belongs_to :user
  has_many :microposts, :source => :user
  
  validates :title, :presence => true
  validates :content, :presence => true
  validates :user_id, :presence => true
  
  default_scope :order => 'stories.created_at DESC'
  

end

class AddStoryId < ActiveRecord::Migration
  def self.up
    add_column :microposts, :story_id, :integer
  end

  def self.down
    remove_column :microposts, :story_id
  end
end

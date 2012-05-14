class AddIndexStoryId < ActiveRecord::Migration
  def self.up
    add_index :microposts, :story_id
  end

  def self.down
  end
end

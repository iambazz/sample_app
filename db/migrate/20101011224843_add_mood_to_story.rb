class AddMoodToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :mood, :string
  end

  def self.down
    remove_column :stories, :mood
  end
end

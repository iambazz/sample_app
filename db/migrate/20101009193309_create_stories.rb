class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :stories, :user_id
  end

  def self.down
    drop_table :stories
  end
end

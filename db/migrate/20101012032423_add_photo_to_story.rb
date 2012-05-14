class AddPhotoToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :photo_file_name, :string # Original filename
    add_column :stories, :photo_content_type, :string #Mime type
    add_column :stories, :photo_file_size, :integer # Filesize in bytes
  end

  def self.down
    remove_column :stories, :photo_file_name
    remove_column :stories, :photo_content_type
    remove_column :stories, :photo_file_size
  end
end

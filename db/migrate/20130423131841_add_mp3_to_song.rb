class AddMp3ToSong < ActiveRecord::Migration
  def change
    add_column :songs, :mp3_file_name, :string
    add_column :songs, :mp3_content_type, :string
    add_column :songs, :mp3_file_size, :integer
    add_column :songs, :mp3_updated_at, :datetime
  end
end

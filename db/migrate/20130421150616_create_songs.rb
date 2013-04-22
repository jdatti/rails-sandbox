class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :body
      t.string :upload_path
      t.boolean :published

      t.timestamps
    end
  end
end

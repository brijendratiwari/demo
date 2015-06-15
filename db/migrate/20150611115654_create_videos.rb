class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video
      t.integer :content_id
      t.string :video_file_name
      t.string :video_content_type
      t.integer :video_file_size
      t.datetime :video_updated_at
      t.datetime :video_updated_at

      t.timestamps
    end
  end
end

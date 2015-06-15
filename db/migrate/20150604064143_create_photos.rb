class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :instagram_photo_id
      t.string :url
      t.integer :user_id
      t.timestamps
    end
  end
end

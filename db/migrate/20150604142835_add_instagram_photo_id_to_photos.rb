class AddInstagramPhotoIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :instagram_photo_id, :integer ,:limit => 8
  end
end

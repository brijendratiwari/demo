class RemoveInstagramPhotoIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :instagram_photo_id, :integer
  end
end

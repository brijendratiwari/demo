class RemoveInstagramIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :users, :instagram_id, :integer
  end
end

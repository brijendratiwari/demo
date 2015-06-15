class RemoveUserIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :user_id, :integer
  end
end

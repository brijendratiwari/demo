class AddUserIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :user_id, :integer , :limit => 8
  end
end

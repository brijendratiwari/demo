class AddPublishStatusToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :publish_status, :string
  end
end

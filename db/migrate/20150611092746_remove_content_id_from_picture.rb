class RemoveContentIdFromPicture < ActiveRecord::Migration
  def change
    remove_column :pictures, :content_id, :integer
  end
end

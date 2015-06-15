class AddContentsIdFromPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :contents_id, :integer
  end
end

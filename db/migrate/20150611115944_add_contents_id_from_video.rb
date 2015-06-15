class AddContentsIdFromVideo < ActiveRecord::Migration
  def change
    add_column :videos, :contents_id, :integer
  end
end

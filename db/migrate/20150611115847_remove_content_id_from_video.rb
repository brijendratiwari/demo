class RemoveContentIdFromVideo < ActiveRecord::Migration
  def change
    remove_column :videos, :content_id, :integer
  end
end

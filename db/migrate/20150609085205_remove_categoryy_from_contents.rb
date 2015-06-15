class RemoveCategoryyFromContents < ActiveRecord::Migration
  def change
    remove_column :contents, :category, :integer
  end
end

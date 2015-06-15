class AddInstagramIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instagram_id, :integer 
  end
end

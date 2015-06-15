class AddInstagramIddfdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instagram_id, :integer, :limit => 8
  end
end

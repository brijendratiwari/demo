class AddDiscriptionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :discription, :text
  end
end

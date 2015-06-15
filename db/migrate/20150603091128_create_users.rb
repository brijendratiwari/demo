class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.text :description
      t.string :profile_image_url
      t.string :photo

      t.timestamps
    end
  end
end

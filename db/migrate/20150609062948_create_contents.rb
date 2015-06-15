class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :location
      t.string :content_type
      t.integer :category
      t.string :featured
      t.string :badges
      t.text :short_description

      t.timestamps
    end
  end
end

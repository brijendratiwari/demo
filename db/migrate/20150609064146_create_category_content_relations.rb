class CreateCategoryContentRelations < ActiveRecord::Migration
  def change
    create_table :category_content_relations do |t|
      t.integer :content_id
      t.integer :category_id

      t.timestamps
    end
  end
end

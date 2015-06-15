class AddPublishStatusToContents < ActiveRecord::Migration
  def change
    add_column :contents, :publish_status, :string
  end
end

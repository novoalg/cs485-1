class CreateCartedItems < ActiveRecord::Migration
  def change
    create_table :carted_items do |t|
      t.belongs_to :user
      t.belongs_to :item
      t.integer :quantity
      t.timestamps
    end
  end
end

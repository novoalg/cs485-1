class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|

      t.integer :item_id
      t.belongs_to :order
      
      t.integer :quantity
      t.decimal :price_per_unit, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end

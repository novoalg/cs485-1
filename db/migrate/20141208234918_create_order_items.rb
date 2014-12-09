class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|

      t.belongs_to :item
      t.belongs_to :order
      
      t.integer :quantity

      t.timestamps
    end
  end
end

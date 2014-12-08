class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :items_orders, id: false do |t|
      t.belongs_to :order
      t.belongs_to :item
    end
  end
end

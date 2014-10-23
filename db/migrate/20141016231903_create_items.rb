class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.string :name
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2

      t.integer :in_stock

      t.timestamps
    end
  end
end

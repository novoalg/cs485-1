class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  add_index :item_categories, :name, unique: true

end

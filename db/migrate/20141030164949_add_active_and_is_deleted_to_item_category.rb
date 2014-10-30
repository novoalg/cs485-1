class AddActiveAndIsDeletedToItemCategory < ActiveRecord::Migration
  def change
    add_column :item_categories, :active, :boolean
    add_column :item_categories, :is_deleted, :boolean
  end
end

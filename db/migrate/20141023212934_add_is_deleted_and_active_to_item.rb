class AddIsDeletedAndActiveToItem < ActiveRecord::Migration
  def change
    add_column :items, :is_deleted, :boolean
    add_column :items, :active, :boolean
  end
end

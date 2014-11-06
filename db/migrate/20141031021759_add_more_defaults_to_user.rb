class AddMoreDefaultsToUser < ActiveRecord::Migration
  def change
    change_column :users, :address, :string, :default => ""
  end
end

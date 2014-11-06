class AddDefaultRoleId < ActiveRecord::Migration
  def change
    change_column :users, :role_id, :integer, :default => 0
  end
end

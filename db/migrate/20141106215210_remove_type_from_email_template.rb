class RemoveTypeFromEmailTemplate < ActiveRecord::Migration
  def change
    remove_column :email_templates, :type, :string
  end
end

class AddEmailTypeToEmailTemplate < ActiveRecord::Migration
  def change
    add_column :email_templates, :email_type, :string
  end
end

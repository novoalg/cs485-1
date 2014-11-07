class AddContentToEmailTemplate < ActiveRecord::Migration
  def change
    add_column :email_templates, :content, :string
  end
end

class ChangeContentToText < ActiveRecord::Migration
  def change
    change_column :email_templates, :content, :text
  end
end

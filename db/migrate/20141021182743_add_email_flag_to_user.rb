class AddEmailFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :can_send_emails, :boolean
  end
end

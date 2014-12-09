class RemoveCanSendEmails < ActiveRecord::Migration
  def change
    remove_column :users, :can_send_emails
  end
end

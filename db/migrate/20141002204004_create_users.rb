class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.string :first_name
      t.string :middle_name
      t.string :last_name

      t.string :home_phone
      t.string :work_phone
      t.string :address

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    
  end
end

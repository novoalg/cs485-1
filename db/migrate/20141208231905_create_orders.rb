class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.belongs_to :user   
      t.text :text    

      t.timestamps
    end
  end
end

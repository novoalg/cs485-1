class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.text :text
      t.boolean :active
      t.timestamps
    end
  end
end

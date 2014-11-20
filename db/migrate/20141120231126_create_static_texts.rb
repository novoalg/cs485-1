class CreateStaticTexts < ActiveRecord::Migration
  def change
    create_table :static_texts do |t|
      t.string :page
      t.string :location 
      t.text :html
      t.timestamps
    end
  end
end

class CreateHomepagePanels < ActiveRecord::Migration
  def change
    create_table :homepage_panels do |t|
      t.string :title
      t.text :text
      t.timestamps
    end

    add_attachment :homepage_panels, :picture
    
  end
end

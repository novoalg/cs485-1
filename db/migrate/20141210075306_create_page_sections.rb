class CreatePageSections < ActiveRecord::Migration
  def change
    create_table :page_sections do |t|
      t.string :title
      t.text :text

      t.string :page
      t.string :section

      t.timestamps
    end

    add_attachment :page_sections, :picture
  end
end

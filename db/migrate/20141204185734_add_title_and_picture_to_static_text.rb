class AddTitleAndPictureToStaticText < ActiveRecord::Migration
  def change
    rename_column :static_texts, :html, :text
    add_attachment :static_texts, :picture
    add_column :static_texts, :title, :text
  end
end

class AddPaperclipToGallery < ActiveRecord::Migration
  def change
    add_attachment :gallery_items, :picture
  end
end

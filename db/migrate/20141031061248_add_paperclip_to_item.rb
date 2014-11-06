class AddPaperclipToItem < ActiveRecord::Migration
  def change
    add_attachment :items, :picture
  end
end

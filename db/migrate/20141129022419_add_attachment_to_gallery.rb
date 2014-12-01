class AddAttachmentToGallery < ActiveRecord::Migration
  def change
    add_attachment :galleries, :picture
  end
end

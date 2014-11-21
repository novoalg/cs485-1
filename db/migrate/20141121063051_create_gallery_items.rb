class CreateGalleryItems < ActiveRecord::Migration
  def change
    create_table :gallery_items do |t|
      t.text :description
      t.timestamps
    end
  end
end

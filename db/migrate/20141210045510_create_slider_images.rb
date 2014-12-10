class CreateSliderImages < ActiveRecord::Migration
  def change
    create_table :slider_images do |t|
      t.string :caption
      t.timestamps
    end

    add_attachment :slider_images, :picture

  end
end

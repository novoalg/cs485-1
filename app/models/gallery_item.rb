class GalleryItem < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "750x750>", :small => "500x500>", :thumb => "250x250>" }, :default_url => "missing/gallery_:style.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end

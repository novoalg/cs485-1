class Gallery < ActiveRecord::Base
  
  validates_presence_of :text
  validates_presence_of :picture

  has_attached_file :picture, :styles => { :large => "3000x2000>", :medium => "600x400>", :small => "300x200>" }, :default_url => "missing/gallery_:style.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end

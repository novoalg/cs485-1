class SliderImage < ActiveRecord::Base

  validates_presence_of :picture

  has_attached_file :picture, :styles => { :large => "1000x400#" }, :default_url => "missing/slider_:style.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end

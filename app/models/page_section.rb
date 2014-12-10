class PageSection < ActiveRecord::Base

  validates_presence_of :text

  has_attached_file :picture, :styles => { :large => "1000x400>", :banner => "1000x400#", :medium => "400x400#" }, :default_url => "missing/page_:style.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end

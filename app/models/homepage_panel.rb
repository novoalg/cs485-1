class HomepagePanel < ActiveRecord::Base
  validates_presence_of :picture
  validates_presence_of :text

  has_attached_file :picture, :styles => { :large => "1000x1000>", :medium => "400x400#" }, :default_url => "missing/homepage_:style.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end

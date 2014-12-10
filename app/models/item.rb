class Item < ActiveRecord::Base

  paginates_per 6

  has_many :carted_items
  has_many :order_items

  belongs_to :item_category
  validates_presence_of :name

  validate :description, :allow_blank => true

  validates_presence_of :price
  validates_inclusion_of :price, :in => 0.00..100000000.00

  validates_presence_of :in_stock
  validates_inclusion_of :in_stock, :in => 0..100000000

  validates_presence_of :item_category_id

  has_attached_file :picture, :styles => { :medium => "500x500>", :small => "300x300#", :thumb => "100x100#" }, :default_url => "missing/missing_:style.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  scope :active, -> { where(:active => true, :is_deleted => false) }
  scope :inactive, -> { where(:active => false, :is_deleted => false) }

  def destroy_item
    self.is_deleted = true
  end

  after_rollback :report_rollback
end

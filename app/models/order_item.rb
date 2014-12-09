class OrderItem < ActiveRecord::Base
  has_one :item
  belongs_to :order
end

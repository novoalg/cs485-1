class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def subtotal 
    self.order_items.inject { | sum, x | sum + (x.price_per_unit * x.quantity) }
  end
end

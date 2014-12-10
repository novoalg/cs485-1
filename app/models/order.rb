class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def subtotal 
    mix = self.order_items.collect { | item | item.price_per_unit * item.quantity }
    mix.inject { | sum, x | sum + x }
  end
end

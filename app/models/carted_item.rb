class CartedItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  before_save :clamp_quantity

  validates_inclusion_of :quantity, :in => 0..100000000

  private 

    def clamp_quantity
      self.quantity = self.item.in_stock if self.quantity > self.item.in_stock
      self.quantity = 0 if self.quantity < 0
    end
    
end

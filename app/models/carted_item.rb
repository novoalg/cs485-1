class CartedItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  before_save :clamp_quantity

  private 

    def clamp_quantity
      self.quantity = self.item.in_stock if self.quantity > self.item.in_stock
    end
    
end

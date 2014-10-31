class InventoryController < ApplicationController

  def index
    @item_categories = ItemCategory.order(:name)
  end

end

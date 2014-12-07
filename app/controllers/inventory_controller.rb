class InventoryController < ApplicationController

  before_filter :role_two, only: [:index]

  def index
    @item_categories = ItemCategory.order(:name)
  end

  def shop
    @item_categories = ItemCategory.order(:name)
  end

end

class InventoryController < ApplicationController

  before_filter :role_one

  def index
    @item_categories = ItemCategory.order(:name)
  end

end

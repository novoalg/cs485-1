class InventoryController < ApplicationController

  before_filter :role_two

  def index
    @item_categories = ItemCategory.order(:name)
  end

end

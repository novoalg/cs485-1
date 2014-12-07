class InventoryController < ApplicationController

  before_filter :role_two, only: [:index]

  def index
    @item_categories = ItemCategory.order(:name)
  end

  def shop
    @items = ItemCategory.find(params[:id]).order(:name).page params[:page]
  end

end

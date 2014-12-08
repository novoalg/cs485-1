class InventoryController < ApplicationController

  before_filter :role_two, only: [:index]

  def index
    @item_categories = ItemCategory.order(:name)
  end

  def shop
    if (params.has_key? :category) && (ItemCategory.exists?(id: params[:category]))
      category = params[:category]
    elsif ItemCategory.all.size 
      category = ItemCategory.first.id
    else 
      flash[:warning] = "There was an error. Please try again."
      redirect_to root_path
    end

    @item_categories = ItemCategory.order(:name)
    @category = ItemCategory.find(category)
    @items = @category.items.page params[:page]
  end

end

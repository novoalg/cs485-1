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
    @items = @category.items.active.page params[:page]

    unless user_signed_in? 
      flash.now[:warning] = "Only registered users may check out. #{ view_context.link_to 'Make an account!', new_user_registration_path }".html_safe
    end
  end

  def change_category
    redirect_to shop_path(category: params[:item_category][:category_id])
  end
end

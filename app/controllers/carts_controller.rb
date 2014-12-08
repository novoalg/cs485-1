class CartsController < ApplicationController

  before_filter :check_login

  def show
  end

  def add_item
    unless current_user.carted_items.exists? item_id: cart_params[:item_id]
      @item = current_user.carted_items.build(cart_params)
    else 
      @item = current_user.carted_items.where(item_id: cart_params[:item_id]).first
      @item.quantity = @item.quantity + cart_params[:quantity].to_i
      if @item.quantity > @item.item.in_stock 
        @item.quantity = @item.item.in_stock
        flash[:warning] = "Your request has been limited by the number of items in stock."
      end
    end
    if @item.save
      flash[:success] = "Added to cart."
      redirect_to shop_path
    else
      flash.now[:alert] = "An error occurred."
      render shop_path
    end
  end

  def update_cart
    if (CartedItem.exists?(id: update_params[:id])) && (current_user.id == CartedItem.find(update_params[:id]).user.id)
      if CartedItem.find(update_params[:id]).update(quantity: update_params[:quantity])
        flash[:success] = "Changed quantity successfully."
      else
        flash[:alert] = "An error has occurred. Please try again."
      end
      redirect_to cart_path
    else
      flash[:alert] = "You can't update items that aren't in your own cart."
      redirect_to cart_path
    end
  end

  def destroy 
    CartedItem.find(params[:id]).destroy
    flash[:success] = "Item removed from cart."
    redirect_to cart_path
  end

  private

    def cart_params
      params.require(:carted_item).permit(:quantity, :item_id)
    end

    def update_params
      params.permit(:quantity, :id)
    end

    def check_login
      unless user_signed_in?
        flash[:warning] = "You must log in before accessing that page."
        redirect_to root_path
      end
    end
end

class CartsController < ApplicationController
  def show
  end

  def add_item
    unless current_user.carted_items.exists? item_id: cart_params[:item_id]
      @item = current_user.carted_items.build(cart_params)
    else 
      @item = current_user.carted_items.where(item_id: cart_params[:item_id]).first
      @item.quantity = @item.quantity + cart_params[:quantity].to_i
    end
    if @item.save
      flash[:success] = "Added to cart."
      redirect_to shop_path
    else
      flash.now[:alert] = "An error occurred."
      render shop_path
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
end

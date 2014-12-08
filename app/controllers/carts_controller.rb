class CartsController < ApplicationController
  def show
  end

  def add_item
    @item = current_user.carted_items.build(cart_params)
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

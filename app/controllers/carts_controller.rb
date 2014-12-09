class CartsController < ApplicationController

  before_filter :check_login
  before_filter :check_full, only: [:checkout, :process_cart]
  before_filter :check_stock, only: [:show, :update_cart, :checkout, :check_stock]

  def show
    @subtotal = current_user.carted_items.collect { | x | (x.quantity * x.item.price) }.inject { |sum, x| sum + x.to_f }
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

  def checkout
    @cart = current_user.carted_items
    @subtotal = current_user.carted_items.collect { | x | (x.quantity * x.item.price) }.inject { |sum, x| sum + x.to_f }
  end

  def process_cart
    @cart = current_user.carted_items

    Item.transaction do 
      check_stock
      @cart.each do | entry | 
        entry.item.in_stock = entry.item.in_stock - entry.quantity 
        entry.item.save
      end

      order = current_user.orders.build
      order.save

      @cart.each do | entry |
        order_item = order.order_items.build
        order_item.item_id = entry.item.id
        order_item.quantity = entry.quantity
        order_item.price_per_unit = entry.item.price
        order_item.save
      end

      UserMailer.order_receipt(order).deliver
      AdminMailer.receive_order(order).deliver
      
      @cart.each do | entry |
        entry.destroy
      end
    end

    flash[:success] = "Your order has been reserved. Thank you!"
    redirect_to shop_path
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

    def check_full
      unless current_user.carted_items.size > 0
        flash[:warning] = "You must have items in the cart in order to be able to check out!"
        redirect_to cart_path
      end
    end

    def check_stock 
      changed = false
      CartedItem.where(user_id: current_user.id).each do | entry |
        if entry.quantity > entry.item.in_stock 
          changed = true
          entry.update_attributes(quantity: entry.item.in_stock)
        end

        if entry.quantity <= 0
          entry.destroy
        end
      end

      if changed
        flash[:warning] = "Please review your cart, as quantities have been changed to reflect current stock."
      end
    end

end

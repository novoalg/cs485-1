class OrdersController < ApplicationController

  before_filter :check_login 
  before_filter :check_employee, only: [:index, :mark_completed]
  before_filter :role_three, only: [:mark_completed]
  before_filter :check_user, only: [:show, :destroy]

  def index
    @orders = Order.all
  end

  def show
    if Order.exists?(id: params[:id])
      @order = Order.find(params[:id])
    else 
      flash[:alert] = "No order with that ID exists."
      redirect_to root_path
    end
  end

  def user
    @orders = Order.where(user_id: current_user.id)
  end

  def destroy 
    if Order.exists?(id: params[:id])
      @order = Order.find(params[:id])

      if @order.completed 
        flash[:warning] = "You cannot cancel an order that has been completed."
        redirect_to my_orders_path
      else
        @order.order_items.each do | item | 
          item.item.update_attributes(in_stock: item.item.in_stock + item.quantity)
          item.destroy
        end

        AdminMailer.receive_cancellation(@order).deliver
        UserMailer.send_cancellation(@order).deliver

        @order.destroy

        flash[:success] = "Order ##{@order.id} has been canceled."
      end
    else 
      flash[:alert] = "No order with that ID exists."
    end 

    redirect_to my_orders_path
  end

  def mark_completed
    if Order.exists?(id: params[:id])
      @order = Order.find(params[:id])
      @order.update_attributes(completed: true)
      flash[:success] = "Order has been completed."

      UserMailer.send_completed(order).deliver

    else 
      flash[:alert] = "No order with that ID exists."
    end

    redirect_to orders_path
  end

  private

    def check_login
      unless user_signed_in?
        flash[:alert] = "You must log in before accessing that page."
        redirect_to root_path
      end
    end

    def check_employee
      unless current_user.role_id >= 2 
        flash[:alert] = "You do not have access to that page."
        redirect_to root_path
      end
    end

    def check_user 
      unless (current_user.role_id >= 2 || Order.find(params[:id]).user.id == current_user.id)
        flash[:alert] = "You do not have access to that page."
        redirect_to root_path
      end 
    end
end

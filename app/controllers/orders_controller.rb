class OrdersController < ApplicationController

  before_filter :check_login 
  before_filter :check_employee, only: [:index]
  before_filter :check_user, only: [:show]

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

class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      current_user = user
      flash.now[:success] = "Welcome, #{user.username}"
      redirect_to root_path
    else
      flash.now[:warning] = "Invalid username/password combination. Please try again."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    current_user = nil
    flash.now[:notice] = "Goodbye!"
    redirect_to root_path
  end

end

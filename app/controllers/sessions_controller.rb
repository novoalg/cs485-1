class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      current_user = user
      flash[:success] = "Welcome, #{user.username}"
      redirect_to root_path
    else
      flash[:warning] = "Invalid username/password combination. Please try again."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    current_user = nil
    flash[:notice] = "Goodbye!"
    redirect_to root_path
  end

end

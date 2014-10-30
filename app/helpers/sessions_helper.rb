module SessionsHelper

  def current_user
    current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def current_user=(user)
    current_user = user
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    current_user = nil
  end
  
  def employee?
    current_user.role_id > 0
  end

  def edit? 
    current_user.role_id > 1
  end

  def add?
    current_user.role_id > 2
  end

  def delete?
    current_user.role_id > 3
  end


end

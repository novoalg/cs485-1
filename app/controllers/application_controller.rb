class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  def role_zero
    unless (user_signed_in? && current_user.role_id >= 0)
      flash[:alert] = "You don't have permission to the page you tried to access."
      redirect_to root_path
    end
  end

  def role_one
    unless (user_signed_in? && current_user.role_id >= 1)
      flash[:alert] = "You don't have permission to the page you tried to access."
      redirect_to root_path
    end
  end

  def role_two
    unless (user_signed_in? && current_user.role_id >= 2)
      flash[:alert] = "You don't have permission to the page you tried to access."
      redirect_to root_path
    end
  end

  def role_three
    unless (user_signed_in? && current_user.role_id >= 3) 
      flash[:alert] = "You don't have permission to the page you tried to access."
      redirect_to root_path
    end
  end

  def role_four
    unless (user_signed_in? && current_user.role_id == 4)
      flash[:alert] = "You don't have permission to the page you tried to access."
      redirect_to root_path
    end
  end

  def can_send_email
    unless (user_signed_in? && current_user.can_send_emails?)
      flash[:alert] = "You don't have permission to the page you tried to access."
      redirect_to root_path
    end
  end

end

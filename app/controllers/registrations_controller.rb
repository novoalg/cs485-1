  class RegistrationsController < Devise::RegistrationsController
    private
   
    def sign_up_params
      params.require(:user).permit(:email, :password, :receive_emails, :password_confirmation)
    end
   
    def account_update_params
      params.require(:user).permit(:email, :password, :receive_emails, :password_confirmation, :current_password)
    end

    def after_sign_up_path_for(resource)
      "/users/#{current_user.id}/edit"
    end
  end
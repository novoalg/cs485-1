class SessionsController < ApplicationController

    include SessionsHelper

    def new
    end

    def create
        user = User.find_by_username(params[:username])
        if user && User.authenticate(params[:password])
            flash[:success] = "Welcome!"
            session[:user_id] = user.id
            current_user = user
            redirect_to root_path
        else
            flash.now[:alert] = "Invalid password/username combination. Please try again."
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        current_user = nil
        flash[:notice] = "Goodbye!"
        redirect_to root_path
    end

end

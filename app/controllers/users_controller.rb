class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
        flash[:success] = "Welcome #{@user.username}"
        session[:user_id] = @user.id
        current_user = @user
        redirect_to root_path
    else
        flash[:notice] = @user.errors.full_messages.to_sentence
        render 'new'
        @user.destroy
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
  end

  private
    
    def user_params
        params.require(:user).permit!
    end
end

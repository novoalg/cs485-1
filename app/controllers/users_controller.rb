class UsersController < ApplicationController
  before_filter :logged_in

  def index
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
    @change_username = true;
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      current_user = @user
      flash[:success] = "Welcome #{@user.username}"
      redirect_to root_path
    else
      flash.now[:notice] = @user.errors.full_messages.to_sentence
      render 'new'
      @user.destroy
    end
  end

  def edit
    @user = User.find params[:id]
    @change_username = false;
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "Profile updated successfuly"
      redirect_to @user
    else
      flash.now[:notice] = @user.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  private
    
    def user_params
      params.require(:user).permit!
    end

    def logged_in
      unless (!current_user.nil?) && ((current_user.is_admin) || (current_user && current_user.id.to_i == params[:id].to_i))
        flash[:notice] = "You don't have permission to the page you tried to access."
        redirect_to root_path
      end 
    end
end

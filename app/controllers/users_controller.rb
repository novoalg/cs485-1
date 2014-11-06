class UsersController < ApplicationController

  before_filter :logged_in, :except => [:new, :create]
  before_filter :role_zero, :only => [:show]
  before_filter :role_one, :only => [:index]
  before_filter :role_four, :only => [:destroy]  

  def index
    @users = User.all.order("role_id desc")
    @roles = Role.all
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
    @user.role_id = 0
    if @user.save
      session[:user_id] = @user.id
      current_user = @user
      UserMailer.welcome_email(@user).deliver
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

  def destroy
    unless params[:id] == '1'
      User.find(params[:id]).destroy
      flash[:success] = "User was successfully destroyed."
      redirect_to root_path
    else 
      flash[:alert] = "Unable to delete admin user."
      redirect_to User.find(params[:id])
    end
  end

  private

    def user_params
      params.require(:user).permit!
    end

    def logged_in
      unless current_user && (current_user.id.to_i == params[:id].to_i || current_user.role_id > 1)
        flash[:notice] = "You don't have permission to the page you tried to access."
        redirect_to root_path
      end
    end

end

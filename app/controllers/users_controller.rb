class UsersController < ApplicationController

  before_filter :logged_in, :except => [:new, :create]
  before_filter :role_one, :only => [:show]
  before_filter :role_two, :only => [:index]
  before_filter :role_five, :only => [:destroy]  

  def index
    @users = User.all.order("role_id desc")
    @roles = Role.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "Profile updated successfully."
      redirect_to @user
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
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

  def unsubscribe
    if user = User.read_access_token(params[:signature])
      user.update_attribute :receive_emails, false
      render text: "You have been unsubscribed."
    else
      render text: "Invalid Link"
    end
  end

  private

    def user_params
      params.require(:user).permit!
    end

    def logged_in
      unless current_user && (current_user.id.to_i == params[:id].to_i || current_user.role_id > 1)
        flash[:alert] = "You don't have permission to the page you tried to access."
        redirect_to root_path
      end
    end

end

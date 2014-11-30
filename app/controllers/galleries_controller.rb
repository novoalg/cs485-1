class GalleriesController < ApplicationController

  before_action :set_gallery, only: [:edit, :update, :destroy]

  before_filter :role_one, except: [:index]
  before_filter :role_two, only: [:edit, :update]
  before_filter :role_three, only: [:new, :create]
  before_filter :role_four, only: [:destroy]

  def index
    @galleries = Gallery.all 
  end

  def new 
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save 
      flash[:success] = "Successfully added a gallery entry." 
      redirect_to galleries_path
    else
      flash.now[:alert] = "Could not save the gallery entry."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @gallery.update_attributes gallery_params
      flash[:success] = "Gallery entry updated successfully."
      redirect_to galleries_path
    else
      flash.now[:alert] = "Could not save the gallery entry."
      render 'edit'
    end
  end

  def destroy
    @gallery.destroy
    flash[:success] = "Gallery entry destroyed." 
    redirect_to galleries_path
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def check_logged_in

    end

    def gallery_params
      params.require(:gallery).permit(:text, :picture)
    end

end

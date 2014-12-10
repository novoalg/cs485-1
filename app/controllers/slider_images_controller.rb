class SliderImagesController < ApplicationController

  before_action :set_slider, only: [:edit, :update, :destroy]
  before_filter :role_two
  before_filter :role_three, only: [:edit, :update]
  before_filter :role_four, only: [:new, :create]
  before_filter :role_five, only: [:delete]

  def index
    @sliders = SliderImage.all
  end

  def edit 
  end

  def update
    if @slider.update_attributes(slider_params)
      flash[:success] = "Your changes have been saved successfully."
      redirect_to slider_images_path
    else 
      render 'edit'
    end
  end

  def new
    @slider = SliderImage.new
  end

  def create
    @slider = SliderImage.new(slider_params)
    if @slider.save
      flash[:success] = "Successfully added slider."
      redirect_to slider_images_path 
    else
      render 'new'
    end
  end

  def destroy
    @slider.destroy
    redirect_to sliders_path
  end

  private
    def set_slider
      if SliderImage.exists?(id: params[:id])
        @slider = SliderImage.find(params[:id])
      else 
        flash[:alert] = "No slider with that ID exists."
        redirect_to root_path
      end
    end

    def slider_params
      params.require(:slider_image).permit(:picture, :caption)
    end

end

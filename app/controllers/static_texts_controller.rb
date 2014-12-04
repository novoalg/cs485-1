class StaticTextsController < ApplicationController

  before_action :set_value
  before_action :role_three

  def edit
  end

  def update
    if @static_text.update_attributes(st_params)
      flash[:success] = "Text successfully updated."
    else 
      flash[:alert] = "Update failed."
    end
    redirect_to root_path
  end

  private
    
    def set_value
      @static_text = StaticText.find(params[:id])
    end

    def st_params
      params.require(:static_text).permit(:text)
    end

end

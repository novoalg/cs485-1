class PageSectionsController < ApplicationController

  before_action :role_three

  def edit
    @section = PageSection.find(params[:id])
  end

  def update
    @section = PageSection.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:success] = "Successfully updated the section."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def section_params
      params.require(:page_section).permit(:picture, :title, :text)
    end
end

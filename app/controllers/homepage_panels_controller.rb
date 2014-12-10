class HomepagePanelsController < ApplicationController

  before_action :set_panel, only: [:edit, :update, :destroy]

  def index
    @panels = HomepagePanel.all
  end

  def new
    @panel = HomepagePanel.new
  end

  def create
    @panel = HomepagePanel.new(panel_params)
    if @panel.save 
      flash[:success] = "Saved panel successfully."
      redirect_to root_path
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    if @panel.update_attributes(panel_params)
      flash[:success] = "Updated panel successfully."
      redirect_to root_path
    else 
      render 'edit'
    end
  end

  def destroy
    @panel.destroy
    redirect_to root_path
  end

  private

    def set_panel
      if HomepagePanel.exists?(id: params[:id])
        @panel = HomepagePanel.find(params[:id])
      else 
        flash[:alert] = "No panel with that ID exists."
        redirect_to root_path
      end
    end

    def panel_params
      params.require(:homepage_panel).permit(:title, :text, :picture)
    end

end

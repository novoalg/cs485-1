class HeadlinesController < ApplicationController

  before_action :set_headline
  before_filter :role_edit

  def edit
  end

  def update
    if @headline.update_attributes(headline_params)
      flash[:success] = "Updated headline successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Could not update headline."
      render 'edit'
    end
  end

  private

    def set_headline
      @headline = Headline.first
    end

    def headline_params
      params.require(:headline).permit(:text, :active)
    end

end

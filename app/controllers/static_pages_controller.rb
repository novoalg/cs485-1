class StaticPagesController < ApplicationController
  def index
    @headline = Headline.first
    @sliders = SliderImage.all
    @panels = HomepagePanel.all
    @description = PageSection.where(page: "static_pages/index", section: "description").first
  end

  def about
    @header = PageSection.where(page: "static_pages/about", section: "header").first
    @first = PageSection.where(page: "static_pages/about", section: "first box").first
    @second = PageSection.where(page: "static_pages/about", section: "second box").first
  end

  def contact
    @blurb = PageSection.where(page: "static_pages/contact", section: "blurb").first
  end

  def contact_us
    unless params[:subject].present? && params[:email].present? && params[:message].present?
      flash.now[:alert] = "Please include a subject, your email, and a message."
      render 'contact'
    else
      AdminMailer.receive_contact(params.permit(:name, :subject, :email, :message)).deliver
      flash[:success] = "Your email has been sent!"
      redirect_to contact_path
    end
  end
end
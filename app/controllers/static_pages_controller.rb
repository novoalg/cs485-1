class StaticPagesController < ApplicationController
  def index
    @headline = Headline.first
    @description = StaticText.first
    @entries = StaticText.find([2, 3, 4, 5, 6, 7])
  end

  def about
    @first = StaticText.find(8)
    @second = StaticText.find(9)
  end

  def contact
    @blurb = StaticText.find(10)
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
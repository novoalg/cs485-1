class StaticPagesController < ApplicationController
  def index
    @headline = Headline.where(:id => 1, :active => true)
  end

  def about
  end

  def contact
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
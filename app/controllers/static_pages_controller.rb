class StaticPagesController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def contact_us
    AdminMailer.receive_contact
    redirect_to contact_path
  end
end
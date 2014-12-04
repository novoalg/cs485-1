class AdminMailer < ActionMailer::Base
  default from: "support@silverandstones.gallery"

  def send_user_email(user, subject, content)
    @content = content
    mail(to: user.email, subject: subject)
  end

  def receive_contact(params)
    @name = params[:name]
    @email = params[:email]
    @content = params[:message]
    mail(to: "support@silverandstones.gallery", subject: "[Contact Us] #{params[:subject]}", reply_to: "#{params[:email]}")
  end

end

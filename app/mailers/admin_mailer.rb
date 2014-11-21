class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_user_email(user)
    @user = user
    @template = EmailTemplate.find(2)
    mail(to: user.email, subject: @template.subject)
  end

  def receive_contact(params)
    @name = params[:name]
    @content = params[:message]
    mail(to: "admin@silverandstones.gallery", subject: "[Contact Us] #{params[:subject]}")
  end

end

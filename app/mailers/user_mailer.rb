class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @template = EmailTemplate.first
    mail(to: @user, subject: "Welcome to Silver & Stones")
  end
end

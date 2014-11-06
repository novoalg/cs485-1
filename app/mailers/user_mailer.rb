class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    mail(to: @user, subject: "Welcome to Silver & Stones")
  end
end

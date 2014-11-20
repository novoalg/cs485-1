class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @template = EmailTemplate.find(1)
    mail(to: @user.email, subject: @template.subject)
  end
end

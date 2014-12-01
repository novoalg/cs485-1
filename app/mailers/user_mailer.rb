class UserMailer < ActionMailer::Base
  default from: "support@silverandstones.gallery"

  def welcome_email(user)
    @user = user
    @template = EmailTemplate.find(1)
    mail(to: @user.email, subject: @template.subject)
  end
end

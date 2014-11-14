class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  
  def send_user_email(user)
    @user = user
    @template = EmailTemplate.find(2)
    mail(to: user.email, subject: @template.subject)
  end
end

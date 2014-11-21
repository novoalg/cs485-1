class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_user_email(user)
    @user = user
    @template = EmailTemplate.find(2)
    mail(to: user.email, subject: @template.subject)
  end

  def receive_contact
    @content = "things and stuff"
    mail(to: "admin@silverandstones.gallery", subject: "Test email", from: "thhuntertgm@gmail.com")
  end

end

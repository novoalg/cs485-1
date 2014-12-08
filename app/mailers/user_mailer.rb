class UserMailer < ActionMailer::Base
  default from: "Silver & Stones Gallery <support@silverandstones.gallery>"

  def welcome_email(user)
    @user = user
    @template = EmailTemplate.find(1)
    mail(to: @user.email, subject: @template.subject)
  end

  def order_receipt(order)
    @order = order
  end
end

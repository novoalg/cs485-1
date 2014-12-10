class UserMailer < ActionMailer::Base
  default from: "Silver & Stones Gallery <support@silverandstones.gallery>"

  def welcome_email(user)
    @user = user
    @template = EmailTemplate.find(1)
    mail(to: @user.email, subject: @template.subject)
  end

  def order_receipt(order)
    @order = order
    mail(to: @order.user.email, subject: "Your Recept from Silver & Stones Gallery [Order ##{@order.id}]")
  end

  def send_cancellation(order)
    @order = order
    mail(to: @order.user.email, subject: "Your order has been canceled [Order ##{@order.id}]")
  end
end

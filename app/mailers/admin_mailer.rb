class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  
  def send_user_email(users, subject)
    @users = users
    @users.each do |user|
        mail(to: user.email, subject: subject)
    end
  end
end

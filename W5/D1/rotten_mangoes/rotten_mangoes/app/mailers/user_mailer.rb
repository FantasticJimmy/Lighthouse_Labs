class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def destroy_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bye!')
  end
end

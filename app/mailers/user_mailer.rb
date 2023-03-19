class UserMailer < ApplicationMailer
  default from: "no-reply@my_api.com"

  def welcome_email(user)
    @user = user
    @url = "https://my_api.com/login"
    mail(to: @user.email, subject: "Welcome to My API")
  end
end

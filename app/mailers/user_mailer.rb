class UserMailer < ApplicationMailer
  def welcome_email(user)
      @user = user
      @url  = 'http://umed.herokuapp.com'
      mail(to: @user.email, subject: 'Welcome to Your UMed space')
  end
end

class UserMailer < ApplicationMailer
  def welcome_email(user)
      @user = user
      @url  = 'http://umed.herokuapp.com'
      mail(to: @user.email, subject: I18n.t('.subject', scope: [:user_mailer, :welcome_email]))
  end
end

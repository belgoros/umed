class UserMailer < ApplicationMailer
  def welcome_email(user)
      @user = user
      @url  = 'http://umed.herokuapp.com'
      mail(to: @user.email, subject: I18n.t('.subject', scope: [:user_mailer, :welcome_email]))
  end

  def new_subscription_email(subscription)
    @subscription = subscription
    @plan = subscription.plan
    mail(to: @subscription.user.email, subject: I18n.t('.subject', scope: [:user_mailer, :new_subscription_email]))
  end
end

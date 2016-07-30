class UserMailer < ApplicationMailer
  include Roadie::Rails::Automatic
  layout 'mailer'

  def welcome_email(user)
      @user = user
      @url  = ENV['app_host']
      mail(to: @user.email, subject: I18n.t('.subject', scope: [:user_mailer, :welcome_email]))
  end

  def new_subscription_email(subscription)
    @subscription = subscription
    @plan = subscription.plan
    mail(to: @subscription.user.email, subject: I18n.t('.subject', scope: [:user_mailer, :new_subscription_email]))
  end

  def expired_subscription_email(subscription)
    @subscription = subscription
    @plan = subscription.plan
    @url = ENV['app_host']
    mail(to: @subscription.user.email, subject: I18n.t('.subject', scope: [:user_mailer, :expired_subscription_email]))
  end
end

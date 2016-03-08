namespace :subscriptions do
  logger = ActiveSupport::Logger.new('log/subscriptions.log', 3, 5.megabytes)
  desc "check for expired subscriptions and send an e-mail to its subscriber"
  task check_expired: :environment do
    logger.info "Start checking expired subscriptions at #{Time.now}"
    expired_subscriptions = Subscription.includes(:user, :plan).where("end_date < :end_date and activated = :activated", { end_date: Date.today, activated: true})
    logger.info("Found #{expired_subscriptions.size} expired subscriptions.")
    expired_subscriptions.each do |subscription|
      user = subscription.user
      subscription.update_attribute(:activated, false)
      if has_active_subscription(user)
        user.update_attribute(:premium, false)
        UserMailer.expired_subscription_email(subscription).deliver_now
      end
      logger.info "Disable subscription id: #{subscription.id}: User #{subscription.user.email}: #{subscription.plan.name}, expired #{I18n.l(subscription.end_date)}."
    end
  end
end

def has_active_subscription(user)
  user.subscriptions.where("end_date > :end_date and activated = :activated", { end_date: Date.today, activated: true}).last
end

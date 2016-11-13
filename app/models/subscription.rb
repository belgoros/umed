class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  has_many :transactions, class_name: 'OrderTransaction', dependent: :destroy
  validates :start_date, :end_date, :express_token, :express_payer_id, :user_id, :plan_id, presence: true

  def purchase
    response = EXPRESS_GATEWAY.purchase(price_in_cents, express_purchase_options)
    transactions.create!(:amount => price_in_cents, :response => response)
    activate_subscription if response.success?
    response.success?
  end

  def express_token=(token)
    write_attribute(:express_token, token)
    if new_record? && !token.blank?
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
    end
  end

  def price_in_cents
    (plan.price * 100).round
  end

  def enroll_for_plan(plan)
    latest_subscription = find_latest_active_subscription
    new_start_date = Date.today
    if latest_subscription
      new_start_date = latest_subscription.end_date.advance(days: 1)
    end
    self.start_date = new_start_date
    self.end_date = new_start_date.advance(months: plan.duration)
    self.plan = plan
  end

  def enroll_for_days(plan, offered_days)
    latest_subscription = find_latest_active_subscription
    new_start_date = Date.today
    if latest_subscription
      new_start_date = latest_subscription.end_date.advance(days: 1)
    end
    self.start_date = new_start_date
    self.end_date = new_start_date.advance(days: offered_days)
    self.plan = plan
    activate_subscription
  end

  private

    def express_purchase_options
      {
        token: express_token,
        payer_id: express_payer_id,
        currency: 'EUR'
      }
    end

    def activate_subscription
      update_attribute(:activated, true)
      user.update_attribute(:premium, true)
    end

    def find_latest_active_subscription
      user.subscriptions.where("end_date > :end_date and activated = :activated", { end_date: Date.today, activated: true}).last
    end
end

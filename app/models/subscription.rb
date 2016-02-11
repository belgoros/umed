class Subscription < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true

  ONE_MONTH = 1.99
  TWO_MONTHS = 2.99
  THREE_MONTHS = 3.99
  PERIODS = [ONE_MONTH, TWO_MONTHS, THREE_MONTHS]

  def purchase
    response = EXPRESS_GATEWAY.purchase(order.total_amount_cents, express_purchase_options)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def to_cents
    (DEFAULT_COST * 100).round
  end

  def express_token=(token)
    write_attribute(:express_token, token)
    if new_record? && !token.blank?
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
    end
  end

  private

    def express_purchase_options
      {
        ip: ip,
        token: express_token,
        payer_id: express_payer_id
      }
    end
end

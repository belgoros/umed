class AddExpressTokenPayerIdPlanIdToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :express_token, :string
    add_column :subscriptions, :express_payer_id, :string
    add_column :subscriptions, :plan_id, :integer
  end
end

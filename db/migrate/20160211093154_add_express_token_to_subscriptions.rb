class AddExpressTokenToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :express_token, :string
    add_column :subscriptions, :express_payer_id, :string
    add_column :subscriptions, :price, :decimal, precision: 5, scale: 2
  end
end

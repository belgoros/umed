class CreateOrderTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_transactions do |t|
      t.integer :subscription_id
      t.integer :amount
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params

      t.timestamps null: false
    end
  end
end

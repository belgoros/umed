class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.boolean :activated, default: false

      t.timestamps null: false
    end
    add_index :subscriptions, :user_id
  end
end

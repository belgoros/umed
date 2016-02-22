class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 5, scale: 2
      t.integer :duration
      t.integer :questions

      t.timestamps null: false
    end
  end
end

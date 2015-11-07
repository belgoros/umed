class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :question_id
      t.timestamps null: false
    end
    add_index :images, :question_id
  end
end

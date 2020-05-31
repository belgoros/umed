class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :question_id
      t.boolean :correct

      t.timestamps null: false
    end
    add_index :answers, :question_id
  end
end

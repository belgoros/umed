class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      t.integer :level_id
      t.integer :subject_id
      t.integer :theme_id
      t.text :question_ids
      t.text :answer_ids

      t.timestamps null: false
    end
  end
end

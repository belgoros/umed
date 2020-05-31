class AddPhotoColumnToQuestions < ActiveRecord::Migration[5.2]
  def up
    add_attachment :questions, :photo
  end

  def down
    remove_attachment :questions, :photo
  end
end

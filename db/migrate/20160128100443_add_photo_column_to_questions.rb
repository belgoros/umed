class AddPhotoColumnToQuestions < ActiveRecord::Migration
  def up
    add_attachment :questions, :photo
  end

  def down
    remove_attachment :questions, :photo
  end
end

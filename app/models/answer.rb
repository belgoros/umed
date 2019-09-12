class Answer < ApplicationRecord
  belongs_to :question
  scope :correct_ids, -> (ids = []) { where(id: ids, correct: true).pluck(:id) }
  validates :text, presence: true
  validates :question_id, presence: true
end

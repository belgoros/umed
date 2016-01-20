class Answer < ActiveRecord::Base
  belongs_to :question
  scope :correct, -> (ids = []) { where(id: ids, correct: true).pluck(:id) }
  validates :text, presence: true
  validates :question_id, presence: true
end

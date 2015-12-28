class Answer < ActiveRecord::Base
  belongs_to :question
  scope :correct, -> (ids = []) { where(id: ids, correct: true).pluck(:id) }
  validates :text, presence: true
end

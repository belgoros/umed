class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :theme

  scope :ids_for_quiz, ->(theme_id = null, limit = 5) { where(theme_id: theme_id).limit(limit).pluck(:id).map(&:to_s) }
  validates :text, presence: true
end

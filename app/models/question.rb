class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :theme
  #postgresql specific query using RANDOM() function
  scope :ids_for_quiz, ->(theme_id, limit = 5) { where(theme_id: theme_id).limit(limit).order("RANDOM()").pluck(:id) }

  validates :text, presence: true
  validates :theme_id, presence: true
end

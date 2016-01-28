class Question < ActiveRecord::Base
  DEFAULT_QUESTIONS_NUMBER = 5
  has_many :answers, dependent: :destroy
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :photo,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                        size: { in: 0..300.kilobytes }
  belongs_to :theme
  #postgresql specific query using RANDOM() function
  scope :ids_for_quiz, ->(theme_id, limit = DEFAULT_QUESTIONS_NUMBER) { where(theme_id: theme_id).limit(limit).order("RANDOM()").pluck(:id) }

  validates :text, presence: true
  validates :theme_id, presence: true

  def correct_answer
    answers.where(correct: true)
  end
end

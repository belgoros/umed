class Question < ApplicationRecord
  DEFAULT_QUESTIONS_NUMBER = 5

  #postgresql specific query using RANDOM() function
  RANDOM_ORDER = Arel.sql('random()')
  # Ordering question answers randomly to avoid guessing when passing a quiz and
  # make it easier to create answers and not forget to have the correct one
  # (starting from from the correct one, for example, then adding the wrong ones)
  has_many :answers, -> { order RANDOM_ORDER }, dependent: :destroy
  has_attached_file :photo,
                    styles: { medium: "100x100>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment :photo,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                        size: { in: 0..5.megabytes }
  belongs_to :theme

  validates :text, presence: true
  validates :theme_id, presence: true

  def correct_answer
    answers.where(correct: true).first
  end

  def self.ids_for_quiz(user, theme_id, limit = DEFAULT_QUESTIONS_NUMBER)
    if user.premium?
      where(theme_id: theme_id).limit(limit.nil? ? DEFAULT_QUESTIONS_NUMBER : limit).order(RANDOM_ORDER).pluck(:id)
    else
      where(theme_id: theme_id).pluck(:id).first(DEFAULT_QUESTIONS_NUMBER)
    end
  end
end

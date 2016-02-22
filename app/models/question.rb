class Question < ActiveRecord::Base
  DEFAULT_QUESTIONS_NUMBER = 5
  has_many :answers, dependent: :destroy
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :photo,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                        size: { in: 0..1.megabytes }
  belongs_to :theme

  validates :text, presence: true
  validates :theme_id, presence: true

  def correct_answer
    answers.where(correct: true)
  end

  def self.ids_for_quiz(theme_id, limit = DEFAULT_QUESTIONS_NUMBER)
    #postgresql specific query using RANDOM() function
    where(theme_id: theme_id).limit(limit.nil? ? DEFAULT_QUESTIONS_NUMBER : limit).order("RANDOM()").pluck(:id)
  end
end

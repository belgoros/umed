class Quiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :level
  belongs_to :subject
  belongs_to :theme
  serialize :question_ids, Array
  serialize :answer_ids, Array


  cattr_accessor :form_steps do
    %w(level subject theme)
  end

  attr_accessor :form_step

  validates :user_id, presence: true
  validates :level_id,   presence: true,  if: -> { required_for_step?(:level) }
  validates :subject_id, presence: true,  if: -> { required_for_step?(:subject)}
  validates :theme_id,   presence: true,  if: -> { required_for_step?(:theme)}

  QUESTIONS_TO_ANSWER = [10, 15, 25]

  def required_for_step?(step)
    # All fields are required if no form step is present
    return true if form_step.nil?

    # All fields from previous steps are required if the
    # step parameter appears before or we are on the current step
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end

  def total_questions
    question_ids.size
  end

  def total_answers
    answer_ids.size
  end

  def correct_answers
    Answer.correct_ids(answer_ids).size
  end

  def score
    "#{correct_answers}/#{total_questions}"
  end

  def answers
    if complete?
      Answer.includes(:question).find(answer_ids)
    else
      []
    end
  end

  def complete?
    !!(level && subject && theme)
  end
end

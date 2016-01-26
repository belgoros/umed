FactoryGirl.define do
  factory :quiz do
    user
    level
    subject
    theme
    question_ids []
    answer_ids []
  end
end

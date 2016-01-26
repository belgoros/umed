FactoryGirl.define do
  factory :quiz do
    user
    level
    subject
    theme
    question_ids [1, 2, 3]
    answer_ids [1, 2, 3]
  end
end

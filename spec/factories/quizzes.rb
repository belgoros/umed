FactoryGirl.define do
  factory :quiz do
    user
    level
    subject
    theme
    question_ids { Array.new(5) { rand(10) } }
    answer_ids   { Array.new(5) { rand(10) } }
  end
end

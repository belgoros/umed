FactoryGirl.define do
  factory :quiz do
    user
    level
    subject
    theme
    question_ids Array.new(10) { rand(50)}
    answer_ids Array.new(10) { rand(50)}
  end
end

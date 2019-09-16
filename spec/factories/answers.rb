FactoryBot.define do
  factory :answer do
    sequence(:text) { |n| "This is a answer nr.#{n}" }
    question
    correct { false }
  end
end

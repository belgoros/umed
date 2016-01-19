FactoryGirl.define do
  factory :answer do
    text { Faker::Lorem.phrase }
    question
    correct false
  end
end

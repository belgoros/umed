FactoryGirl.define do
  factory :answer do
    text { FFaker::Lorem.phrase }
    question
    correct false
  end
end

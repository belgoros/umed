FactoryGirl.define do
  factory :subject do
    name { FFaker::Lorem.words(2) }
    level
  end
end

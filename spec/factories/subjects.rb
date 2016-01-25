FactoryGirl.define do
  factory :subject do
    name { FFaker::Lorem.phrase }
    level
  end
end

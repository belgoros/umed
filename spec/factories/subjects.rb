FactoryGirl.define do
  factory :subject do
    name { Faker::Lorem.phrase }
    level
  end
end

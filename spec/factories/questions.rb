FactoryGirl.define do
  factory :question do
    text { Faker::Lorem.phrase }
    theme
  end
end

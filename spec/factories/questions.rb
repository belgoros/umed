FactoryGirl.define do
  factory :question do
    text { FFaker::Lorem.phrase }
    theme
  end
end

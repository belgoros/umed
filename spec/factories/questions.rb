FactoryBot.define do
  factory :question do
    text { FFaker::Lorem.words(3) }
    theme
  end
end

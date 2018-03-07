FactoryBot.define do
  factory :contact do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    message { FFaker::Lorem.sentence }
  end
end

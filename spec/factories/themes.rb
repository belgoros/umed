FactoryBot.define do
  factory :theme do
    name { FFaker::Lorem.words(3) }
    subject
  end

end

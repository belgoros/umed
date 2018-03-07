FactoryBot.define do
  factory :level do
    sequence :name do |n|
    "#{FFaker::Skill.specialties }-#{n}"
    end
  end
end

FactoryGirl.define do
  factory :level do
    name { FFaker::Skill.specialties }
  end
end

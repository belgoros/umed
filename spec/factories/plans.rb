FactoryBot.define do
  factory :plan do
    factory :free_plan do
      name "Free"
      description "Free Plan"
      price 0
      duration 999
      questions 20
    end

    factory :premium_plan do
      name "Premium"
      description "Premium Plan"
      duration 1
      price 3
      questions 1000
    end

    factory :premium_plus_plan do
      name "Premium Plus"
      description "Premium Plus Plan"
      duration 3
      price 7
      questions 1000
    end
  end
end

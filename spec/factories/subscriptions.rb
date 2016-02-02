FactoryGirl.define do
  factory :subscription do
    user
    activated false

    factory :activated_subscrition do
      start_date { Time.now }
      end_date { start_date.advance(year: 1)}
      activated true
    end

    factory :expired_subscription do
      start_date { 2.years.ago }
      end_date { start_date.advance(year: 1) }
    end
  end
end

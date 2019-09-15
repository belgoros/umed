FactoryBot.define do
  factory :subscription do
    user
    activated {true}

    factory :one_month_subscription do
      association :plan, factory: :premium_plan
      start_date { Date.new }
      end_date { start_date.advance(months: 1)}
      express_token {"AZERTY123"}
      express_payer_id {123}
    end

    factory :three_months_subscription do
      association :plan, factory: :premium_plus_plan
      start_date { Date.new }
      end_date { start_date.advance(months: 3)}
      express_token {"AZERTY123"}
      express_payer_id {123}

    end

    factory :expired_subscription do
      association :plan, factory: :premium_plus_plan
      start_date { 2.years.ago }
      end_date { start_date.advance(year: 1) }
      express_token {"AZERTY123"}
      express_payer_id {123}
    end
  end
end

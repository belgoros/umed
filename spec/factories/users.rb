FactoryGirl.define do
  factory :user do
    email    { FFaker::Internet.email }
    password { Devise.friendly_token.first(8) }
    unique_session_id { Devise.friendly_token.first(12)}

    factory :admin do
      admin true
    end

    factory :premium_user do
      premium true
    end
  end
end

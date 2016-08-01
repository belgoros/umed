require 'rails_helper'

describe Subscription, type: :model do

  context 'validations' do
    it { should validate_presence_of(:user_id)}
    it { should validate_presence_of(:start_date)}
    it { should validate_presence_of(:end_date)}
    it { should validate_presence_of(:express_token)}
    it { should validate_presence_of(:express_payer_id)}
  end

  context "associations" do
    it { should belong_to(:user)}
    it { should belong_to(:plan)}
    it { should have_many(:transactions)}
  end

  context "#enroll_for method" do
    let(:premium_plan) { create(:premium_plan)}

    it "should enroll for premium plan with start date of today" do
      subscription = build(:subscription, plan: premium_plan)
      subscription.save(validate: false)
      subscription.enroll_for_plan(premium_plan)
      expect(subscription.start_date).to eq Date.today
    end

    it "should enroll for premium plan with existing activated subscription" do
      setup_dates
      subscription = build(:subscription, plan: premium_plan, start_date: @start_date, end_date: @end_date)
      subscription.save(validate: false)

      new_subscription = build(:subscription, plan: premium_plan, user: subscription.user)
      new_subscription.save(validate: false)
      new_subscription.enroll_for_plan(premium_plan)

      expect(new_subscription.start_date).to eq @end_date.advance(days: 1)
      expect(new_subscription.end_date).to eq @end_date.advance(days: 1, months: 1)
    end
  end
end

def setup_dates
  @start_date = Date.today
  @end_date = @start_date.advance(months: 1)
end

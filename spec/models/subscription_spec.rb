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
      subscription.enroll_for_plan(premium_plan)
      expect(subscription.start_date).to eq Date.new
    end
  end
end

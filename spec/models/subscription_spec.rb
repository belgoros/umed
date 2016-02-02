require 'rails_helper'

describe Subscription, type: :model do

  context 'validations' do
    it { should validate_presence_of(:user_id)}
  end

  it { should belong_to(:user)}

  context "activation" do
    it "should not be activated by default" do
      subscription = create(:subscription)
      expect(subscription.activated).to be false
    end

    it 'should be expired when the end date passed' do
      subscription = create(:expired_subscription)
      expect(subscription.activated).to be false
    end
  end
end

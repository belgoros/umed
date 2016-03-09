require 'rails_helper'

describe Plan, type: :model do
  context "validations" do

    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:questions)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:duration)}
    it { should validate_presence_of(:description)}

    it { should validate_numericality_of(:price)}
    it { should validate_numericality_of(:questions).only_integer }
    it { should validate_numericality_of(:duration).only_integer }
  end

  context "associations" do
    it { should have_many(:subscriptions)}
  end

  describe "#total_in_cents return rounded price in cents" do
    it "should return zero" do
      plan = create(:free_plan)
      expect(plan.total_in_cents).to eq 0
    end
    it "should return priced plan price" do
      plan = create(:premium_plan)
      expect(plan.total_in_cents).to eq 300
    end
  end

  context "::priced scope" do
    it "should return priced plans" do
      create(:premium_plan)
      create(:premium_plus_plan)
      create(:free_plan)
      expect(Plan.priced.size).to eq 2
    end

    it "should return no priced plans" do
      plan = create(:free_plan)
      expect(Plan.priced.size).to eq 0
    end
  end
end

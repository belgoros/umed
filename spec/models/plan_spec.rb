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
end

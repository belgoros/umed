require 'rails_helper'

describe Subject, type: :model do
  context 'validations' do
    subject { build(:subject)}

    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of(:level_id)}
  end

  it { should belong_to(:level)}
  it { should have_many(:themes)}
end

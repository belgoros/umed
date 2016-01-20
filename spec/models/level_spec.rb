require 'rails_helper'

RSpec.describe Level, type: :model do

  context 'validations' do
    subject { build(:level)}
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of(:name)}
  end

  it { should have_many(:subjects) }
end

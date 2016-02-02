require 'rails_helper'

describe Theme, type: :model do
  context 'validations' do
    subject { build(:theme)}

    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of(:subject_id)}
  end

  it { should belong_to(:subject)}
  it { should have_many(:questions)}
end

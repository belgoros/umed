require 'rails_helper'

describe Answer, type: :model do
  it { should validate_presence_of(:text) }

  context 'should always be in the context of a question' do
    it { should belong_to(:question)}
    it { should validate_presence_of(:question_id)}
  end
end

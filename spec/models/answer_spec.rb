require 'rails_helper'

describe Answer, type: :model do
  it { should validate_presence_of(:text) }

  context 'should always be in the context of a question' do
    it { should belong_to(:question)}
    it { should validate_presence_of(:question_id)}
  end

  context "returning answer IDs" do
    before(:all) do
      @a1 = create(:answer, correct: true)
      @a2 = create(:answer, correct: true)
      @a3 = create(:answer)
      @ids = Answer.correct_ids([@a1.id, @a2.id, @a3.id])
    end

    it "should return the correct number of answers" do
      expect(@ids.size).to eq(2)
    end

    it "should return only the correct answers ids" do
      expect(@ids).to include(@a1.id, @a2.id)
    end
  end

end

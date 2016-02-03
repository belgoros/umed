require 'rails_helper'

describe QuizzesHelper, :type => :helper do

  describe "generating selection criteria for the quiz" do
    let(:quiz) { create(:quiz)}
    it "should concatenate quiz level, subject and theme" do
      expect(selection_for(quiz)).to eq("#{quiz.level.name}->#{quiz.subject.name}->#{quiz.theme.name}")
    end
  end
end

require 'rails_helper'

describe Quiz, type: :model do
  context "associations" do
    it { should belong_to(:user)}
    it { should belong_to(:level)}
    it { should belong_to(:subject)}
    it { should belong_to(:theme)}
  end

  context "validations" do
    it { should validate_presence_of(:user_id)}
    it { should validate_presence_of(:level_id)}
    it { should validate_presence_of(:subject_id)}
    it { should validate_presence_of(:theme_id)}
  end

  context "return completed quizzes" do
    let(:quiz) { create(:quiz)}

    it "should be complete" do
      expect(quiz.complete?).to be true
    end
    it "should not be complete without level" do
      quiz.level = nil
      expect(quiz.complete?).to be false
    end

    it "should not be complete without subject" do
      quiz.subject = nil
      expect(quiz.complete?).to be false
    end

    it "should not be complete without theme" do
      quiz.theme = nil
      expect(quiz.complete?).to be false
    end
  end
end

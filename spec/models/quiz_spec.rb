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

  context "#answers" do
    before(:each) { @quiz = create(:quiz)}

    it "should return quiz answers" do
      setup_quiz_answers(@quiz)
      expect(@quiz.answers).not_to be_empty
    end

    it "should return no answers" do
      @quiz.update_attributes(level_id: nil, subject_id: nil, theme_id: nil)
      expect(@quiz.answers).to be_empty
    end
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

  def setup_quiz_answers(quiz)
    questions = create_list(:question, 3)
    answers = []
    questions.each do |question|
      answers << create(:answer, question: question)
    end
    @quiz.update_attributes(question_ids: questions.map(&:id), answer_ids: answers.map(&:id))
  end
end

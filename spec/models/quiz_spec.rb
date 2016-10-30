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

  describe "#finished scope" do
    it "should return 1 finished quiz" do
      quiz = create(:quiz)
      expect(Quiz.finished(quiz.user)).not_to be_empty
    end

    it "should return no finished quizzes" do
      quiz = build(:quiz, level: nil, subject: nil, theme: nil)
      quiz.save(validate: false)
      expect(Quiz.finished(quiz.user)).to be_empty
    end
  end

  describe "#total_questions" do
    let(:quiz) { create(:quiz) }

    it "should return correct number of quiz questions" do
      expect(quiz.total_questions).to eq 5
    end

    it "should return zero quiz questions" do
      quiz.update_attribute(:question_ids, [])
      expect(quiz.total_questions).to eq 0
    end
  end

  describe "#total_answers" do
    let(:quiz) { create(:quiz) }

    it "should return correct number of quiz answers" do
      expect(quiz.total_answers).to eq 5
    end

    it "should return zero quiz answers" do
      quiz.update_attribute(:answer_ids, [])
      expect(quiz.total_answers).to eq 0
    end
  end

  describe "#correct_answers" do
    it "should return the number of correct answers" do
      quiz = create(:quiz, answer_ids: [])
      answer = create(:answer, correct: true)
      quiz.answer_ids << answer.id
      expect(quiz.correct_answers).to eq 1
    end
  end

  describe "#score" do
    it "return the text presentation of the quiz score" do
      quiz = create(:quiz, answer_ids:[], question_ids: [])
      setup_quiz_answers(quiz)
      expect(quiz.score).to eq "#{quiz.correct_answers}/#{quiz.total_questions}"
    end
  end

  def setup_quiz_answers(quiz)
    questions = create_list(:question, 3)
    answers = []
    questions.each do |question|
      answers << create(:answer, question: question)
    end
    quiz.update_attributes(question_ids: questions.map(&:id), answer_ids: answers.map(&:id))
  end
end

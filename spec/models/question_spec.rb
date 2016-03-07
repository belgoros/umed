require 'rails_helper'

describe Question, type: :model do
  it { should validate_presence_of(:text)}
  it { should validate_presence_of(:theme_id)}

  it { should have_many(:answers) }
  it { should belong_to(:theme)}

  context "#correct_answer" do
    before(:all) do
      @question = create(:question)
      2.times { create(:answer, question: @question)}
      create(:answer, question: @question, correct: true)
    end

    it "should return one correct answer for question" do
      answer = @question.correct_answer
      expect(answer).not_to be_nil
      expect(answer.correct?).to be true
    end
  end

  context "ids array for quiz" do
    before(:all) {@user = create(:premium_user)}

    it "should be empty array if no theme specified" do
      ids = Question.ids_for_quiz(@user, nil, nil)
      expect(ids).to be_empty
    end

    context "should have the size of specified limit" do
      before(:all) do
        @theme = create(:theme)
        create_list(:question, 6, theme: @theme)
      end

      describe "returns default number of ids" do
        specify "when no questions number specified" do
          ids = Question.ids_for_quiz(@user, @theme.id)
          expect(ids.size).to eq(Question::DEFAULT_QUESTIONS_NUMBER)
        end

        specify "when questions number specified as nil" do
          ids = Question.ids_for_quiz(@user, @theme.id, nil)
          expect(ids.size).to eq(Question::DEFAULT_QUESTIONS_NUMBER)
        end
      end

      it "returns the specified number of ids" do
        ids = Question.ids_for_quiz(@user, @theme.id, 6)
        expect(ids.size).to eq(6)
      end
    end
  end
end

require 'rails_helper'

describe Question, type: :model do
  it { should validate_presence_of(:text)}
  it { should validate_presence_of(:theme_id)}

  it { should have_many(:answers) }
  it { should belong_to(:theme)}

  context "ids array for quiz" do
    it "should be empty array if no theme specified" do
      ids = Question.ids_for_quiz(nil)
      expect(ids).to be_empty
    end

    context "should have the size of specified limit" do
      before(:all) do
        @theme = create(:theme)
        6.times do |text|
          create(:question, theme: @theme, text: "question-#{text}")
        end
      end

      context "returns default number of ids" do
        specify "when no questions number specified" do
          ids = Question.ids_for_quiz(@theme.id)
          expect(ids.size).to eq(Question::DEFAULT_QUESTIONS_NUMBER)
        end

        specify "when questions number specified as nil" do
          ids = Question.ids_for_quiz(@theme.id, nil)
          expect(ids.size).to eq(Question::DEFAULT_QUESTIONS_NUMBER)
        end
      end

      it "returns the specified number of ids" do
        ids = Question.ids_for_quiz(@theme.id, 6)
        expect(ids.size).to eq(6)
      end
    end
  end
end

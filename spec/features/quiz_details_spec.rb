require 'rails_helper'

feature "Quiz Details", type: :feature do
  let(:user) { create(:user) }

  before(:each) do
    question = create(:question)
    answer_ids = question.answers.map(&:id)
    @quiz = create(:quiz, user: user, question_ids: [question.id], answer_ids: answer_ids)
    signin_user(user.email, user.password)
  end

  scenario "User can see the details of a quiz" do
    visit quizzes_path
    click_link I18n.t('links.details')
    expect(page).to have_title(I18n.t('.title', scope: [:quizzes, :details]))
  end
end

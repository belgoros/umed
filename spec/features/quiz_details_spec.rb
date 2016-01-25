require 'rails_helper'

feature "Quiz Details", type: :feature do
  let(:user) { create(:user) }
  let!(:quiz) { create(:quiz, user: user) }

  before(:each) { signin_user(user.email, user.password)}

  scenario "User can see the details of a quiz" do
    visit quizzes_path
    click_link I18n.t('links.details')
    expect(page).to have_title(I18n.t('.title', scope: [:quizzes, :details]))
  end
end

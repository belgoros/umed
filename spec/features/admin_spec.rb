require 'rails_helper'

feature "Admin User", type: :feature do
  let(:user)  { create(:user)}
  let(:level) { create(:level)}

  before(:each) do
    signin_user(user.email, user.password)
  end

  scenario "Not-Admin User has no access to levels list" do
    visit levels_path
    expect(page).to have_content(I18n.t('errors.messages.access_denied'))
  end

  scenario "Not-Admin User cannot edit a level" do
    visit edit_level_path(level)
    expect(page).to have_content(I18n.t('errors.messages.access_denied'))
  end

  scenario "Not-Admin User cannot see a level" do
    visit level_path(level)
    expect(page).to have_content(I18n.t('errors.messages.access_denied'))
  end
end

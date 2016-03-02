require 'rails_helper'

feature "Navigations", type: :feature do
  scenario "Admin user should see all the links in the navbar" do
    user = create(:admin)
    signin_user(user.email, user.password)
    expect(page).to have_link(I18n.t('links.take_quiz'))
    expect(page).to have_link(I18n.t('links.levels'))
    expect(page).to have_link(I18n.t('links.subjects'))
    expect(page).to have_link(I18n.t('links.themes'))
    expect(page).to have_link(I18n.t('links.questions'))
    expect(page).to have_link(I18n.t('links.answers'))
    expect(page).to have_link(I18n.t('links.dashboard'))
  end

  scenario "Not admin user should not see admin links" do
    user = create(:user)
    signin_user(user.email, user.password)
    expect(page).to have_link(I18n.t('links.take_quiz'))
    expect(page).not_to have_link(I18n.t('links.levels'))
    expect(page).not_to have_link(I18n.t('links.subjects'))
    expect(page).not_to have_link(I18n.t('links.themes'))
    expect(page).not_to have_link(I18n.t('links.questions'))
    expect(page).not_to have_link(I18n.t('links.answers'))
    expect(page).to have_link(I18n.t('links.dashboard'))
  end
end

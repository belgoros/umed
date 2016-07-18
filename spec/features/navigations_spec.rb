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

  scenario "Not signed in user should not see sign out link" do
    visit root_path
    expect(page).not_to have_link(I18n.t('links.sign_out'))
  end

  scenario "Not signed in user should see sign in and sign up links" do
    visit root_path
    expect(page).to have_link(I18n.t('links.sign_in'))
    expect(page).to have_link(I18n.t('links.sign_up'))
  end

  scenario "Signed in user should see sign in and sign out links" do
    user = create(:user)
    signin_user(user.email, user.password)
    visit root_path
    expect(page).to have_link(I18n.t('links.sign_out'))
  end

  scenario "Signed in user should not see sign in link" do
    user = create(:user)
    signin_user(user.email, user.password)
    visit root_path
    expect(page).to have_link(I18n.t('links.sign_out'))
  end
end

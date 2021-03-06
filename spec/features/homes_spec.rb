require 'rails_helper'

feature "Home page", type: :feature do

  before { visit root_path }

  scenario "display footer links" do
    expect(page).to have_link(I18n.t('links.home'))
    expect(page).to have_link(I18n.t('links.credits'))
    expect(page).to have_link(I18n.t('links.about'))
    expect(page).to have_link(I18n.t('links.faq'))
    expect(page).to have_link(I18n.t('links.contact'))
  end

  scenario "display FAQ page" do
    click_link I18n.t('links.faq')

    expect(page).to have_current_path(faq_path)
    expect(page).to have_title(full_title(I18n.t('.title', scope: [:home, :faq])))
  end

  scenario "display Credits page" do
    click_link I18n.t('links.credits')

    expect(page).to have_current_path(credits_path)
    expect(page).to have_title(full_title(I18n.t('.title', scope: [:home, :credits])))
  end

  scenario "display About page" do
    click_link I18n.t('links.about')

    expect(page).to have_current_path(about_path)
    expect(page).to have_title(full_title(I18n.t('.title', scope: [:home, :about])))
  end
end

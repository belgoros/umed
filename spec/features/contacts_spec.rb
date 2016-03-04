require 'rails_helper'

feature "User can contact Umed via Contact form", type: :feature do
  before(:each) do
    clear_emails
    visit root_path
  end

  scenario "user access new contact form" do
    click_link I18n.t('links.contact')
    expect(page).to have_current_path(new_contact_path)
    expect(page).to have_title(full_title(I18n.t('.title', scope: [:contacts, :new])))
  end

  scenario "user send an email via contact form" do
    click_link I18n.t('links.contact')
    fill_in(I18n.t('.name', scope: [:simple_form, :labels, :contact]), with: "Guest user")
    fill_in(I18n.t('.email', scope: [:simple_form, :labels, :contact]), with: "guest@gmail.com")
    fill_in(I18n.t('.message', scope: [:simple_form, :labels, :contact]), with: "How can I start ?")
    click_button(I18n.t('.create', scope: [:helpers, :submit, :contact]))
    open_email('info@umed.be')

    expect(current_email.subject).to eq(I18n.t('.subject', scope: [:contact_mailer]))
    expect(current_email).to have_content('How can I start ?')
  end
end

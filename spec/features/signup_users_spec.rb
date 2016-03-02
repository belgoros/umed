require 'rails_helper'

feature "Signup", type: :feature do
  before(:each) {clear_emails }

  scenario 'Signed up user receives a welcome email' do
    visit new_user_registration_path
    fill_in('user[email]', with: 'newuser@example.com')
    fill_in('user[password]', with: 'somePass!')
    fill_in('user[password_confirmation]', with: 'somePass!')
    click_button(I18n.t('.sign_up', scope: [:devise, :registrations, :new]))

    open_email('newuser@example.com')
    expect(current_email.to).to eq ["newuser@example.com"]
    expect(current_email.subject).to eq I18n.t('.subject', scope: [:user_mailer, :welcome_email])
    expect(current_email).to have_content(I18n.t('.body.title', scope: [:user_mailer, :welcome_email]))
    clear_emails
  end
end

require 'rails_helper'

feature "Signing in existing Users", type: :feature do
  let(:user) { create(:user)}

  scenario "User should be able to sign in with valid credentials" do
    signin_user(user.email, user.password)
    expect(page).to have_content(I18n.t('.signed_in', scope: [:devise, :sessions]))
  end

  scenario "User should not be able to sign in with invalid email" do
    invalid_inputs = %w(nil '' wrong@)
    invalid_inputs.each do |email|
      signin_user(email, user.password)
      expect(page).not_to have_content(I18n.t('.signed_in', scope: [:devise, :sessions]))
    end
  end

  scenario "User should not be able to sign in with invalid password" do
    invalid_inputs = %w(nil '' wrong@)
    invalid_inputs.each do |email|
      signin_user(email, user.password)
      expect(page).not_to have_content(I18n.t('.signed_in', scope: [:devise, :sessions]))
    end
  end
end

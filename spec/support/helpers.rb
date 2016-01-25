module Umed
  module Features
    module Authentication
      def signin_user(email, password)
        visit new_user_session_path
        fill_in("user[email]", with: email)
        fill_in("user[password]", with: password)
        click_on(I18n.t('.sign_in', scope: [:devise, :sessions, :new]))
      end
    end
  end
end

RSpec.configure do |config|
  config.include Umed::Features::Authentication, type: :feature
end

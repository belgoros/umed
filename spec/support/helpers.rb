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

    module Quiz
      def create_quiz(user)
        theme = create(:theme)
        quiz = create(:quiz, level: theme.subject.level, subject: theme.subject, theme: theme, user: user)
        quiz
      end
    end
  end
end

RSpec.configure do |config|
  config.include Umed::Features::Authentication, type: :feature
  config.include Umed::Features::Quiz, type: :feature
end

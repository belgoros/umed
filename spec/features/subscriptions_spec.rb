require 'rails_helper'

feature "Subscriptions", type: :feature do
  describe 'users with premium account' do
    before(:each) do
      @premium_user = create(:premium_user)
      signin_user(@premium_user.email, @premium_user.password)
      @quiz = create_quiz(@premium_user)
    end

    specify "can select number of quiz questions" do
      visit(quiz_step_path(@quiz, id: Quiz.form_steps.last))
      expect(page).to have_content I18n.t('.questions_to_answer', scope: [:quiz, :steps, :theme])
    end
  end

  describe 'users without premium account' do
    before(:each) do
      @user = create(:user)
      signin_user(@user.email, @user.password)
      @quiz = create_quiz(@user)
    end

    specify "can select number of quiz questions" do
      visit(quiz_step_path(@quiz, id: Quiz.form_steps.last))
      expect(page).not_to have_content I18n.t('.questions_to_answer', scope: [:quiz, :steps, :theme])
    end
  end

  describe 'admin users' do
    before(:each) do
      @user = create(:admin)
      signin_user(@user.email, @user.password)
      @quiz = create_quiz(@user)
    end

    specify "can select number of quiz questions" do
      visit(quiz_step_path(@quiz, id: Quiz.form_steps.last))
      expect(page).to have_content I18n.t('.questions_to_answer', scope: [:quiz, :steps, :theme])
    end
  end
end

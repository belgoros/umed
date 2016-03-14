class Quiz::QuestionsController < ApplicationController
  include Wicked::Wizard

  before_action :find_quiz, only: [:show, :update]
  before_action :set_steps
  before_action :setup_wizard

  def show
    if step == Wicked::FINISH_STEP
      redirect_to details_quiz_path(@quiz), notice: t(:quiz_finished_success, model: Quiz.model_name.human)
    else
      @question = Question.find(step)
      render_wizard nil, { template: 'quiz/questions/question'}
    end

  end

  def update
    @quiz.answer_ids.push(params[:quiz][:answer_ids].to_i) if params[:quiz] && !params[:quiz][:answer_ids].blank?
    #No need to save the quiz, render_wizzard saves it when passing in an object
    render_wizard @quiz
  end

  def finish_wizard_path
    quizzes_path
  end

  private

    def find_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    def set_steps
      question_ids = @quiz.question_ids
      self.steps = question_ids.map(&:to_s)
    end

    def quiz_params()
      params.require(:quiz).permit('level_id', 'subject_id', 'theme_id', 'question_ids', 'answer_ids')
    end
end

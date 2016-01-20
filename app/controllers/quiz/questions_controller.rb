class Quiz::QuestionsController < ApplicationController
  include Wicked::Wizard

  before_action :set_steps
  before_action :setup_wizard

  def show
    if step == Wicked::FINISH_STEP
      redirect_to finish_wizard_path, notice: t(:quiz_finished_success, model: Quiz.model_name.human)
    else
      @quiz = Quiz.find(params[:quiz_id])
      @question = Question.find(step)

      render_wizard nil, { template: 'quiz/questions/question'}
    end

  end

  def update
    @quiz = Quiz.find(params[:quiz_id])
    @quiz.answer_ids.push(params[:quiz][:answer_ids]) if params[:quiz]
    #No need to save the quiz, render_wizzard saves it when passing in an object
    render_wizard @quiz
  end

  def finish_wizard_path
    quizzes_path
  end

  private

  def set_steps
    quiz = Quiz.find(params[:quiz_id])
    question_ids = quiz.question_ids
    self.steps = question_ids
  end

  def quiz_params()
    params.require(:quiz).permit('level_id', 'subject_id', 'theme_id', 'question_ids', 'answer_ids')
  end
end

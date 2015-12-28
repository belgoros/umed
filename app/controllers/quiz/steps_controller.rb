class Quiz::StepsController < ApplicationController
 include Wicked::Wizard

  steps *Quiz.form_steps

  def show
    @quiz = Quiz.find(params[:quiz_id])
    render_wizard
  end

  def update
    @quiz = Quiz.find(params[:quiz_id])
    @quiz.update(quiz_params(step))

    if step.to_s == 'theme'
      @quiz.question_ids = Question.ids_for_quiz(@quiz.theme.id, 3)
      @quiz.save!
      redirect_to quiz_question_path(@quiz, id: @quiz.question_ids.first)
    else
      render_wizard @quiz
    end
  end

  private

  def quiz_params(step)
    permitted_attributes = case step
      when "level"
        [:level_id]
      when "subject"
        [:subject_id]
      when "theme"
        [:theme_id]
      end

    params.require(:quiz).permit(permitted_attributes).merge(form_step: step)
  end
end

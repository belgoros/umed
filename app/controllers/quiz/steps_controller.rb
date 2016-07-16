class Quiz::StepsController < ApplicationController
 include Wicked::Wizard

  steps *Quiz.form_steps

  def show
    @quiz = Quiz.find(params[:quiz_id])
    case step
    when 'subject'
      load_subjects(@quiz)
    when "theme"
      load_themes(@quiz)
    else
      load_levels
    end
    render_wizard
  end

  def update
    @quiz = Quiz.find(params[:quiz_id])
    @quiz.update(quiz_params(step))
    if step.to_s == steps.last
      @quiz.question_ids = Question.ids_for_quiz(current_user, @quiz.theme.id, params['questions_to_answser'])
      @quiz.save(validate: false)
      redirect_to quiz_question_path(@quiz, id: @quiz.question_ids.first)
    else
      render_wizard @quiz
    end
  end

  private

    def load_levels
      @levels = Level.all.order(:name)
    end

    def load_subjects(quiz)
      level = quiz.level
      @subjects = level.subjects.order(:name)
      @subjects
    end

    def load_themes(quiz)
      @themes = quiz.subject.themes.order(:name)
      @themes
    end

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

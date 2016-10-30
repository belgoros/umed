class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.finished(current_user).page params[:page]
  end

  def details
    @quiz = current_user.quizzes.find(params[:id])
    @answers = Kaminari.paginate_array(@quiz.answers).page(params[:page]).per(10)
  end

  def create
    @quiz = current_user.quizzes.new
    @quiz.save(validate: false)
    redirect_to quiz_step_path(@quiz, Quiz.form_steps.first)
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: t(:destroyed_success, model: Quiz.model_name.human) }
      format.json { head :no_content }
    end
  end
end

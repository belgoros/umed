class AnswersController < ApplicationController
  before_action :sign_in_admin, except: [:index]
  before_action :find_question, only: [:new, :create]
  before_action :set_answer, only: [:edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/new
  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @question.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: t(:created_success, model: Answer.model_name.human)}
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer.question, notice: t(:updated_success, model: Answer.model_name.human)}
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    question = @answer.question
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question, notice: t(:destroyed_success, model: Answer.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    def find_question
      @question = Question.find(params[:question_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:text, :correct, :subject)
    end
end

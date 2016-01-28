class QuestionsController < ApplicationController
  before_action :sign_in_admin, except: [:index, :show]
  before_action :find_theme, only: [:new, :create]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all.page params[:page]
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = @theme.questions.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = @theme.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: t(:created_success, model: Question.model_name.human)}
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: t(:updated_success, model: Question.model_name.human) }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    theme = @question.theme
    @question.destroy
    respond_to do |format|
      format.html { redirect_to theme, notice: t(:destroyed_success, model: Question.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    def find_theme
      @theme = Theme.find(params[:theme_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :subject, :photo)
    end
end

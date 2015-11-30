class ThemesController < ApplicationController
  before_action :sign_in_admin, except: [:index, :show]
  before_action :find_subject, only: [:new, :create]
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  # GET /themes
  # GET /themes.json
  def index
    @themes = Theme.all.page params[:page]
  end

  # GET /themes/1
  # GET /themes/1.json
  def show
  end

  # GET /themes/new
  def new
    @theme = @subject.themes.new
  end

  # GET /themes/1/edit
  def edit
  end

  # POST /themes
  # POST /themes.json
  def create
    @theme = @subject.themes.new(theme_params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @subject, notice: t(:created_success, model: Theme.model_name.human) }
        format.json { render :show, status: :created, location: @theme }
      else
        format.html { render :new }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /themes/1
  # PATCH/PUT /themes/1.json
  def update
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to @theme.subject, t(:updated_success, model: Theme.model_name.human) }
        format.json { render :show, status: :ok, location: @theme }
      else
        format.html { render :edit }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /themes/1
  # DELETE /themes/1.json
  def destroy
    subject = @theme.subject
    @theme.destroy
    respond_to do |format|
      format.html { redirect_to subject, notice: t(:destroyed_success, model: Theme.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    def find_subject
      @subject = Subject.find(params[:subject_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_params
      params.require(:theme).permit(:name, :subject_id)
    end
end

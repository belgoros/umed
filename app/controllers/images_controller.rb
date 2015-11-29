class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  # GET /subjects/new
  def new
    @image = Image.new
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to images_url, notice: t(:created_success, model: Image.model_name.human) }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update

  end

  def destoy

  end

  private

  def image_params
    params.require(:image).permit(:photo)
  end
end

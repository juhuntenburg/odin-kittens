class KittensController < ApplicationController
  before_action :set_kitten, only: %i[show edit update destroy]

  # GET /kittens
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  # GET /kittens/:id
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  # GET /kittens/new
  def new
    @kitten = Kitten.new
  end

  # POST /kittens
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, notice: "Kitten was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /kittens/:id/edit
  def edit
  end

  # PATCH/PUT /kittens/:id
  def update
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Kitten was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /kittens/:id
  def destroy
    @kitten.destroy
    redirect_to kittens_path, notice: "Kitten was successfully deleted."
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end

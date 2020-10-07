class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.json { render :json => @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kitten_path(@kitten.id), notice: 'New Kitten successfully created'
    else
      @kitten = Kitten.new(kitten_params)
    end
  end

  def show
    respond_to do |format|
      format.json { render :json => @kitten }
    end
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to kitten_path(@kitten.id), notice: 'Kitten successfully updated'
    else
      @kitten = Kitten.edit
    end
  end

  def destroy
    @kitten.destroy
    redirect_to kittens_path, notice: 'Kitten killed. :('
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end

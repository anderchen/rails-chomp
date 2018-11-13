class DietsController < ApplicationController
  before_action :set_diet, only: [:validate, :show, :edit, :update, :destroy]

  def index
    @diets = Diet.all
  end

  def show
  end

  def new
    @diet = Diet.new
  end

  def create
    @diet = Diet.new(diet_params)
    if @diet.save
      redirect_to diet_path(@diet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @diet.update(diet_params)
      redirect_to diet_path(@diet)
    else
      render :new
    end
  end

  def destroy
    @diet.destroy
  end

  private

  def set_diet
    @diet = Diet.find(params[:id])
  end

  def diet_params
    params.require(:diet).permit(:name)
  end
end

class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: %i{show edit update destroy }
  
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to new_diary_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to foods_path
    else
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private
  def food_params
    params.require(:food).permit(:food_name, :calories, :protein, :fats, :carbs, :servings)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
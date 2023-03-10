class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: %i{show edit update destroy }
  
  def new
    @food = Food.new
    @time_of_day = params[:time_of_day]
  end

  def create
    food = Food.new
    food.food_name = food_params[:food_name]  
    food.calories = food_params[:calories]  
    food.protein = food_params[:protein]
    food.fats = food_params[:fats]
    food.carbs = food_params[:carbs]
    food.servings = food_params[:servings]
    food.user_id = current_user.id
    if food.save
      redirect_to new_diary_path(time_of_day: food_params[:time_of_day])
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
    redirect_to diaries_path
  end

  private
  def food_params
    params.require(:food).permit(:food_name, :calories, :protein, :fats, :carbs, :servings, :time_of_day)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
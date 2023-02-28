class FoodsMealsController < ApplicationController

def new
  @meal = Meal.find(params[:id])
  @foodsMeal = FoodsMeal.new
end

def create
  @foodsMeal = FoodsMeal.new(foods_meal_params)
  @foodsMeal.user_id = current_user.id
  if @foodsMeal.save
    redirect_to diaries_path
  end
end

private
  def foods_meal_params
    params.require(:foods_meal).permit(:food_id, :meal_id)
  end

end
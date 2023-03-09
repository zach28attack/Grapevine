class FoodsMealsController < ApplicationController

def new
  @meal = Meal.find(params[:id])
  @foodsMeal = FoodsMeal.new
  @time_of_day = params[:time_of_day] #set the @time_of_day variable with the time_of_day parameter 
end

def create
  foods_meal = FoodsMeal.new
  foods_meal.food_id = foods_meal_params[:food_id]
  foods_meal.meal_id = foods_meal_params[:meal_id]
  foods_meal.user_id = current_user.id
  if foods_meal.save
    redirect_to new_foods_meal_path(id: foods_meal.meal_id, time_of_day: foods_meal_params[:time_of_day])
  end
end

def destroy
  foods_meal = FoodsMeal.find(params[:id])
  if foods_meal.destroy
    redirect_to new_foods_meal_path
  end
end

private
  def foods_meal_params
    params.require(:foods_meal).permit(:food_id, :meal_id, :time_of_day) #get the time of day as a param
  end

end
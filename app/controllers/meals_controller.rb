class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def create
    m = Meal.new
    m.meal_name = meal_params[:meal_name]
    if m.save
      redirect_to new_foods_meal_path(id: m.id, time_of_day: meal_params[:time_of_day])
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:meal_name, :time_of_day) #get the time of day as a param
  end
end
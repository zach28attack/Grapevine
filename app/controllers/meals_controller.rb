class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def create
    m = Meal.new(meal_params)
    if m.save
      redirect_to meals_path
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:meal_name)
  end
end
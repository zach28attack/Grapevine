class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    
  end

  def destroy
    
  end

  private
  def food_params
    params.require(:food).permit(:food_name, :calories, :protein, :fats, :carbs, :servings)
  end
end
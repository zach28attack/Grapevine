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
    if @food.save
      redirect_to root_path
    end
  end

  def update
    
  end

  def destroy
    
  end

end
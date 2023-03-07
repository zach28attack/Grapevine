class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: %i{ show edit update destroy }
  before_action :set_empty_diaries, only: %i{index}


  def new
    @diary = Diary.new   
    @foods = Food.all
    @meal = Meal.new
    @foods_meals = FoodsMeal.all.select(:meal_id).distinct #create an array of unique meal_id's
  end

  def index
    @diaries = current_user.diaries.created_today
    @cals_eaten = @diaries.sum(:calories_eaten)
    @fats_eaten = @diaries.sum(:fats_eaten)
    @protein_eaten = @diaries.sum(:protein_eaten)
    @carbs_eaten = @diaries.sum(:carbs_eaten)
    @cals_left = current_user.cals_budget - @cals_eaten
    @protein_left = current_user.protein_budget - @protein_eaten
    @fats_left = current_user.fats_budget - @fats_eaten
    @carbs_left = current_user.carbs_budget - @carbs_eaten
    @diary = Diary.last
    @sum = @diaries.sum(:calories_eaten)
    @breakfast_diaries = @diaries.by_time_of_day("Breakfast")
    @lunch_diaries = @diaries.by_time_of_day("Lunch")
    @dinner_diaries = @diaries.by_time_of_day("Dinner")
  end

  def show
    #may remove action#
  end

  def edit
  end

  def create
    # debugger
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if @diary.save
      redirect_to diaries_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:calories_eaten, :protein_eaten, :fats_eaten, :carbs_eaten, :servings, :time_of_day, :food_id, :meal_id)
  end

  def set_empty_diaries  
    ["Breakfast", "Lunch", "Dinner"].each do |time_of_day|                                                
      diary = current_user.diaries.find_by(time_of_day: time_of_day, created_at: Date.current.all_day)
      unless diary
        current_user.diaries.create!(
        calories_eaten: 0,            #
        protein_eaten: 0,             # if current_user has not logged any any diaries yet today  
        fats_eaten: 0,                # populate default diaries for breakfast, lunch, and dinner
        carbs_eaten: 0,               #
        time_of_day: time_of_day      # 
        )    
      end
    end
  end
end
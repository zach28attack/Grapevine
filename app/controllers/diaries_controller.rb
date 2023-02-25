class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: %i{ show edit update destroy }
  before_action :set_empty_diaries, only: %i{index}


  def new
    @diary = Diary.new   
    @foods = Food.all
  end

  def index

    @diaries = Diary.all.select do |d|                  #select only diaries created today
      d.created_at.day == Time.zone.now.to_datetime.day
    end
    
    @calsEaten = 0      # initialize variables
    @fatsEaten = 0      #
    @proteinEaten = 0   #
    @carbsEaten = 0     #

    @diaries.each do |d|                #
      @calsEaten += d.calories_eaten    #
      @fatsEaten += d.fats_eaten        # iterate through @diaries and assign 
      @proteinEaten += d.protein_eaten  # sum of macros_eaten to variable
      @carbsEaten += d.carbs_eaten      #
    end
    @calsLeft = current_user.cals_budget - @calsEaten             # find the difference of the users
    @proteinLeft = current_user.protein_budget - @proteinEaten    # budgeted macros and what the user 
    @fatsLeft = current_user.fats_budget - @fatsEaten             # has logged as eaten
    @carbsLeft = current_user.carbs_budget - @carbsEaten          #
    @diary = Diary.last
  end

  def show
  end

  def edit
  end

  def create
    @diary = Diary.new
    if @food
      @diary.calories_eaten = @food.calories    #grab food from food list and populate Diary fields
      @diary.protein_eaten = @food.protein
      @diary.fats_eaten = @food.fats
      @diary.carbs = @food.carbs
    else
      @diary = Diary.new(diary_params)
    end

    @diary.user_id = current_user.id
    if @diary.save
      redirect_to diaries_path
    else
      render :new
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
    params.require(:diary).permit(:calories_eaten, :protein_eaten, :fats_eaten, :carbs_eaten, :servings, :time_of_day)
  end


  def set_empty_diaries                                                   
    diary = Diary.find_or_create_by(time_of_day: "breakfast") do |diary|
      diary.calories_eaten = 0            #
      diary.protein_eaten = 0             # if user has not logged any any diaries yet  
      diary.fats_eaten = 0                # populate default diaries for breakfast, lunch, and dinner
      diary.carbs_eaten = 0               # for use of naming sub diaries
      diary.user_id = current_user.id     #
    end
    diary.save
  
    Diary.find_or_create_by(time_of_day: "lunch") do |diary|
      diary.calories_eaten = 0
      diary.protein_eaten = 0
      diary.fats_eaten = 0
      diary.carbs_eaten = 0
      diary.user_id = current_user.id
    end
    diary.save
  
    Diary.find_or_create_by(time_of_day: "dinner") do |diary|
      diary.calories_eaten = 0
      diary.protein_eaten = 0
      diary.fats_eaten = 0
      diary.carbs_eaten = 0
      diary.user_id = current_user.id
    end
    diary.save
  end
  
end
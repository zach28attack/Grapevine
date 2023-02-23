class DiariesController < ApplicationController
  before_action :set_diary, only: %i{ show edit update destroy }
  #carbs 50% of total cals
    #4 cals per gram

  #fats 30% of total cals
    # 9 cals per gram

  #protein 20% of total cals
    #4 cals per gram

  def new
    @diary = Diary.new
    current_user.calories_budget ? totalCal = current_user.calories_budget : totalCal = 2000
    
    @diary.calories_budget = totalCal
    @diary.protein_budget = ((totalCal * 0.2) / 4).to_i   #
    @diary.fats_budget = ((totalCal * 0.3) / 9)           # to calculate macro targets
    @diary.carbs_budget = ((totalCal * 0.5) / 4)          #
  end

  def index
    @diaries = Diary.all
  end

  def show
  end

  def edit
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user = current_user
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
    params.require(:diary).permit(:calories_eaten, :protein_eaten, :fats_eaten, :carbs_eaten, :servings)
  end

end
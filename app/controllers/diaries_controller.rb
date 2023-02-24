class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: %i{ show edit update destroy }
  before_action :set_totals, only: %i{index create}
  #carbs 50% of total cals
    #4 cals per gram

  #fats 30% of total cals
    # 9 cals per gram

  #protein 20% of total cals
    #4 cals per gram
    
  # @diary.calories_budget = totalCal
  # @diary.protein_budget = ((totalCal * 0.2) / 4).to_i   #
  # @diary.fats_budget = ((totalCal * 0.3) / 9)           # to calculate recommended macro targets
  # @diary.carbs_budget = ((totalCal * 0.5) / 4) 


  def new
    @diary = Diary.new   
  end

  def index
    @diaries = Diary.all.select do |d| #select only diaries created today
      d.created_at.day == Date.today.day
    end
    
    if Diary.last
      @diary = Diary.last
      @diary.calories_left
      @diary.protein_left 
      @diary.fats_left 
      @diary.carbs_left 
    end
    
  end

  def show
  end

  def edit
  end

  def create
    @diary = Diary.new(diary_params)
    current_user.calories_budget ? totalCal = current_user.calories_budget : totalCal = 2000
    
    if Diary.last && Diary.last.calories_left.nil?
      @diary.calories_left = totalCal
      @diary.calories_left -= @diary.calories_eaten
      @diary.protein_left = @dTotal.protein_budget
      @diary.protein_left -= @diary.protein_eaten
      @diary.fats_left = @dTotal.fats_budget
      @diary.fats_left -= @diary.fats_eaten
      @diary.carbs_left = @dTotal.carbs_budget
      @diary.carbs_left -= @diary.carbs_eaten
    elsif Diary.last
      @diary.calories_left = Diary.last.calories_left
      @diary.calories_left -= @diary.calories_eaten
      @diary.protein_left = Diary.last.protein_left
      @diary.protein_left -= @diary.protein_eaten
      @diary.fats_left = Diary.last.fats_left
      @diary.fats_left -= @diary.fats_eaten
      @diary.carbs_left = Diary.last.carbs_left
      @diary.carbs_left -= @diary.carbs_eaten
    end
    
    @diary.calories_left ||= totalCal
    @diary.calories_left -= @diary.calories_eaten
    @diary.protein_left ||= @dTotal.protein_budget
    @diary.protein_left -= @diary.protein_eaten
    @diary.fats_left ||= @dTotal.fats_budget
    @diary.fats_left -= @diary.fats_eaten
    @diary.carbs_left ||= @dTotal.carbs_budget
    @diary.carbs_left -= @diary.carbs_eaten
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

  def set_totals
      @dTotal = Diary.new
      current_user.calories_budget ? totalCal = current_user.calories_budget : totalCal = 2000
      @dTotal.calories_budget = totalCal
      @dTotal.protein_budget = ((totalCal * 0.2) / 4).to_i   #
      @dTotal.fats_budget = ((totalCal * 0.3) / 9)           # to calculate recommended macro targets
      @dTotal.carbs_budget = ((totalCal * 0.5) / 4)

  end

end
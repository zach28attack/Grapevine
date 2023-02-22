class DiaryController < ApplicationController
  before_action :set_diary, only: %i{show edit update destroy }

  def new
    @diary = Diary.new
  end

  def index
    @diaries = Diary.all
  end

  def show
  end

  def edit
  end

  def create
    
  end

  def update
  end

  def destroy
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])

  end
end
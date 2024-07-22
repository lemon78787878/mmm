class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @diaries = Diary.all
    @diary = Diary.new
  end

  def create
    @diary = Diary.create(diary_params)
    if @diary.save
      redirect_to diaries_path
    else
      @diaries = Diary.all
      render :index
    end
  end

  def date
    @date = params[:date]
    @diaries = current_user.diaries.where(diary_day: @date)
  end

  def edit_by_date
    @date = params[:date]
    @diaries = current_user.diaries.where(diary_day: @date)
  end

  def update_by_date
    @date = params[:date]
    @diaries = current_user.diaries.where(diary_day: @date)
    @diaries.each do |diary|
      diary.update(diary_params)
    end
    redirect_to diaries_by_date_path(date: @date), notice: 'Diaries were successfully updated.'
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to diaries_path
    else
      render :edit
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path
  end


  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:diary_day, :dish).merge(user_id: current_user.id)
  end
end

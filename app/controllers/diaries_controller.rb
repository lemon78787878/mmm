class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:edit, :update, :destroy]

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

  def edit
    @date = @diary.diary_day
  end

  def update
    if @diary.update(diary_params)
      redirect_to diaries_path, notice: 'Diary was successfully updated.'
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
    params.require(:diary).permit(:diary_day, :dish, :image).merge(user_id: current_user.id)
  end

end

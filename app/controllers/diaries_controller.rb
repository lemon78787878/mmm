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
      render :new
    end
  end

  def show
  end
  def edit
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
    redirect_to diaries_path, notice: 'Diary was successfully destroyed.'
  end


  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:diary_day, :dish).merge(user_id: current_user.id)
  end
end

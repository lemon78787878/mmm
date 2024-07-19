class FoodsController < ApplicationController
  before_action :set_food, only: [:edit, :update]

  def index
    @foods = Food.all
    @foods_by_category = @foods.group_by { |food| food.category }
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to foods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to foods_path
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to foods_path(@food)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def food_params
    params.require(:food).permit(:category_id, :food_name, :stock, :quantity_id, :deadline, :image).merge(user_id: current_user.id)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end



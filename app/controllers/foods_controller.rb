class FoodsController < ApplicationController

  def index
    @foods = Food.order("created_at DESC")
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def food_params
    params.require(:food).permit(:category_id, :food_name, :stock, :quantity_id, :deadline, :image).merge(user_id: current_user.id)
  end
end


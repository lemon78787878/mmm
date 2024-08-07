class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @food = Food.new
  end

  def create
    @recipe = Recipe.new(content: Recipe.generate_recipe(params[:ingredients]))

    if @recipe.save
      redirect_to @recipe, notice: 'レシピが正常に生成されました。'
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end

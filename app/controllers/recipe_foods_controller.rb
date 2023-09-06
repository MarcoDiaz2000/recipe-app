class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = @recipe

    if @recipe_food.save
      flash[:notice] = 'Ingredient added successfully'
      redirect_to @recipe
    else
      flash[:alert] = 'Ingredient failed to add'
      render :new
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end

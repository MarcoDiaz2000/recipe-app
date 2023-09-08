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

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.update(recipe_food_params)
      flash[:notice] = 'Ingredient updated successfully'
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = 'Ingredient failed to update'
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.destroy
      flash[:notice] = 'Ingredient deleted successfully'
    else
      flash[:alert] = 'Ingredient failed to delete'
    end

    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end

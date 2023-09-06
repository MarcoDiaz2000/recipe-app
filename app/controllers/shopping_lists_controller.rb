class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = @user.recipes
    @general_food_list = @user.foods
    @missing_food_items = calculate_missing_food_items(@recipes, general_food_list)
    @total_missing_items = @missing_food_items.values.sum
    @total_missing_price = calculate_total_missing_price(@missing_food_items)
  end

  private

  # Calculate missing food items by comparing the recipes' food items with the general food list
  def calculate_missing_food_items(recipes, general_food_list)
    missing_food_items = Hash.new(0)

    recipes.each do |recipe|
      recipe.foods.each do |food|
        general_quantity = general_food_list.find_by(name: food.name)&.quantity || 0
        missing_quantity = [food.quantity - general_quantity, 0].max
        missing_food_items[food.name] += missing_quantity
      end
    end

    missing_food_items
  end

  # Calculate the total price of missing food items
  def calculate_total_missing_price(missing_food_items)
    total_price = 0

    missing_food_items.each do |food_name, quantity|
      food = current_user.foods.find_by(name: food_name)
      total_price += food.price * quantity if food
    end
    total_price
  end
end

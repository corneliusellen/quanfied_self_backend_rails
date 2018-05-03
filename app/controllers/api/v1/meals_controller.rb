class Api::V1::MealsController < ApplicationController
  before_action :find_food_and_meal, only: [:create, :destroy]

  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params[:meal_id])
  end

  def create
    @meal.foods << @food
    render json: {message: "Successfully added #{@food.name} to #{@meal.name}"}
  end

  def destroy
    find_foodmeal.destroy
    render json: {message: "Successfully removed #{@food.name} from #{@meal.name}"}
  end

  private

  def find_food_and_meal
    @food = Food.find(params[:food_id])
    @meal = Meal.find(params[:meal_id])
  end

  def find_foodmeal
    FoodMeal.find_by(meal_id: @meal.id, food_id: @food.id)
  end
end

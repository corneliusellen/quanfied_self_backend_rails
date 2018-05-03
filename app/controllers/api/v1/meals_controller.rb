class Api::V1::MealsController < ApplicationController

  def index
    render json: Meal.all
  end

  def show
    begin
      render json: Meal.find(params[:meal_id])
    rescue
      render status: 404
    end
  end

  def create
    begin
      meal = Meal.find(params[:meal_id])
      food = Food.find(params[:food_id])
      meal.foods << food
      render json: {message: "Successfully added #{food.name} to #{meal.name}"}
    rescue
      render status: 404
    end
  end

  def destroy
    begin
      food = params[:food_id]
      meal = params[:meal_id]
      food_name = Food.find(food).name
      meal_name = Meal.find(meal).name
      foodmeal = FoodMeal.find_by(meal_id: meal, food_id: food)
      foodmeal.destroy
      render json: {message: "Successfully removed #{food_name} from #{meal_name}"}
    rescue
      render status: 404
    end
  end
end

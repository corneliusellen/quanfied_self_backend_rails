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
  end
end

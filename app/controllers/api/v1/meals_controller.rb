class Api::V1::MealsController < ApplicationController

  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params[:meal_id])
  end

  def create
  end

  def destroy
  end
end

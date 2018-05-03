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
  end

  def destroy
  end
end

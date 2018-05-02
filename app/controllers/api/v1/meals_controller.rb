class Api::V1::MealsController < ApplicationController

  def index
    render json: Meal.all
  end

  def show
  end

  def create
  end

  def destroy
  end
end

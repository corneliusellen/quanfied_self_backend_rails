class Api::V1::FoodsController < ApplicationController

  def index
    render json: Food.all
  end

  def show
    begin
      render json: Food.find(params[:id])
    rescue
      render status: 404
    end
  end

  def create
    food = Food.new(name: params[:name], calories: params[:calories])
    if food.save
      render json: food
    else
      render status: 400
    end
  end
end

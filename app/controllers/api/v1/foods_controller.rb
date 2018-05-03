class Api::V1::FoodsController < ApplicationController
  before_action :find_food, only: [:show, :update, :destroy]
  before_action :validate_params, only: [:create, :update]

  def index
    render json: Food.all
  end

  def show
      render json: find_food
  end

  def create
    food = Food.create(name: params[:food][:name], calories: params[:food][:calories])
    render json: food
  end

  def update
    find_food.update(name: params[:food][:name], calories: params[:food][:calories])
    render json: find_food
  end

  def destroy
    find_food.destroy
    render status: 204
  end

  private

  def find_food
    food ||= Food.find(params[:id])
  end

  def validate_params
    unless params.require(:food).permit(:name && :calories).present?
      render status: 400
    end
  end
end

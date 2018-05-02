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
end

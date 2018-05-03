class NewFoodSerializer < ActiveModel::Serializer
  attributes :food

  def food
    render json: object
  end
end

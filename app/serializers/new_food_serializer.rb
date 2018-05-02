class NewFoodSerializer < ActiveModel::Serializer
  attributes :food

  def food
    FoodSerializer.new(object)
  end
end

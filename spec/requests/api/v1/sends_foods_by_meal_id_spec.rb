require 'rails_helper'

describe "Meals API" do
  it "sends all foods associated with meal id" do
    fruit = create(:food)
    veggie = create(:food)
    breakfast = create(:meal)
    breakfast.foods << [fruit, veggie]

    get "/api/v1/meals/#{breakfast.id}/foods"

    result = JSON.parse(response.body)

    expect(result).to be_a Hash
    expect(result["name"]).to eq(breakfast.name)
    expect(result["foods"].count).to eq(2)
    expect(result["foods"][0]["name"]).to eq(fruit.name)
    expect(result["foods"][0]["calories"]).to eq(fruit.calories)
  end

  it "send 404 if meal is not found" do
    get "/api/v1/meals/12345/foods"

    expect(response.status).to eq(404)
  end
end

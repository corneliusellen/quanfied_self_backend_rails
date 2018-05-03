require 'rails_helper'

describe "Meal API" do
  it "adds an existing food to an existing meal" do
    dessert = create(:food)
    breakfast = create(:meal)

    post "/api/v1/meals/#{breakfast.id}/foods/#{dessert.id}"

    result = JSON.parse(response.body)

    expect(result["message"]).to eq("Successfully added #{dessert.name} to #{breakfast.name}")
    expect(breakfast.foods).to eq([dessert])
  end

  it "sends 404 if meal cannot be found" do
    dessert = create(:food)

    post "/api/v1/meals/12345/foods/#{dessert.id}"

    expect(response.status).to eq(404)
  end

  it "sends 404 if food cannot be found" do
    breakfast = create(:meal)

    post "/api/v1/meals/#{breakfast.id}/foods/12345"

    expect(response.status).to eq(404)
  end
end

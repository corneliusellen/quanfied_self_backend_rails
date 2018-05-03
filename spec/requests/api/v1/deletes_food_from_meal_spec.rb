require 'rails_helper'

describe "Meal API" do
  it "deletes an existing food from an existing meal" do
    dessert = create(:food, name: "Cookies")
    breakfast = create(:meal)
    breakfast.foods << dessert

    delete "/api/v1/meals/#{breakfast.id}/foods/#{dessert.id}"

    result = JSON.parse(response.body)

    expect(result["message"]).to eq("Successfully removed #{dessert.name} from #{breakfast.name}")
    expect(Meal.first.foods).to eq([])
  end

  it "sends 404 if meal cannot be found" do
    dessert = create(:food)

    delete "/api/v1/meals/12345/foods/#{dessert.id}"

    expect(response.status).to eq(404)
  end

  it "sends 404 if food cannot be found" do
    breakfast = create(:meal)

    delete "/api/v1/meals/#{breakfast.id}/foods/12345"

    expect(response.status).to eq(404)
  end
end

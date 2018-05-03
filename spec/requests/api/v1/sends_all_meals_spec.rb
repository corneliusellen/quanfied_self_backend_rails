require 'rails_helper'

describe "Meals API" do
  it "sends all meals and associated foods" do
    fruit = create(:food)
    veggie = create(:food)
    lunch = create(:meal)
    dinner = create(:meal)
    lunch.foods << [fruit, veggie]
    dinner.foods << veggie

    get '/api/v1/meals'

    result = JSON.parse(response.body)

    expect(result).to be_an Array
    expect(result.count).to eq(2)
    expect(result[0]["name"]).to eq(lunch.name)
    expect(result[0]["foods"].count).to eq(2)
    expect(result[1]["foods"][0]["name"]).to eq(veggie.name)
    expect(result[1]["foods"][0]["calories"]).to eq(veggie.calories)
  end
end

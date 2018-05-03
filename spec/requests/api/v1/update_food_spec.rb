require 'rails_helper'

describe 'Food API' do
  it 'allows user to update a new food with name or calories' do
    yumyumyum = create(:food)
    params = {food: {name: yumyumyum.name, calories: '2000'}}
    patch "/api/v1/foods/#{yumyumyum.id}", params: params

    result = JSON.parse(response.body)

    expect(result).to be_a Hash
    expect(result["name"]).to eq(yumyumyum.name)
    expect(result["calories"]).to eq(2000)
  end

  it "returns 400 if food is not saved" do
    yumyumyum = create(:food)
    params = {food: {yumminess: 'off the charts'}}
    patch "/api/v1/foods/#{yumyumyum.id}", params: params

    expect(response.status).to eq(400)
  end
end

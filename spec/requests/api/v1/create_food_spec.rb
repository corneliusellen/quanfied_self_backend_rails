require 'rails_helper'

describe 'Food API' do
  it 'allows use to create a new food with name and calories' do
    params = {name: 'banana', calories: '10'}
    post '/api/v1/foods', params: params

    result = JSON.parse(response.body)

    expect(result).to be_a Hash
    expect(result["name"]).to eq('banana')
    expect(result["calories"]).to eq(10)
  end

  it "returns 400 if food is not saved" do
    params = {name: 'ice cream'}
    post '/api/v1/foods', params: params

    expect(response.status).to eq(400)
  end
end

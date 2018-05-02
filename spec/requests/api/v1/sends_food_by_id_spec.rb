require 'rails_helper'

describe 'Food API' do
  it 'returns food by id' do
    yum = create(:food)

    get "/api/v1/foods/#{yum.id}"

    result = JSON.parse(response.body)

    expect(result).to be_a Hash
    expect(result["id"]).to eq(yum.id)
    expect(result["name"]).to eq(yum.name)
    expect(result["calories"]).to eq(yum.calories)
  end

  it 'returns 404 if food does not exist' do
    get "/api/v1/foods/12345"

    expect(response.status).to eq(404)
  end
end

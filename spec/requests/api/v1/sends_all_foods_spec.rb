require 'rails_helper'

describe 'Foods API' do
  it 'returns all foods in database' do
    yummy = create(:food)
    yummier = create(:food)

    get '/api/v1/foods'

    result = JSON.parse(response.body)

    expect(result.count).to eq(2)
    expect(result[0].count).to eq(3)
    expect(result[0]["id"]).to eq(yummy.id)
    expect(result[0]["name"]).to eq(yummy.name)
    expect(result[0]["calories"]).to eq(yummy.calories)
  end
end

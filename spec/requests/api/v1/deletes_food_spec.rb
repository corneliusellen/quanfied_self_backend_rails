require 'rails_helper'

describe 'Food API' do
  it "deletes food by id" do
    gross = create(:food)
    expect(Food.count).to eq(1)

    delete "/api/v1/foods/#{gross.id}"

    expect(response.status).to eq(204)
    expect(Food.count).to eq(0)
  end

  it "raises 404 if food not found" do
    delete "/api/v1/foods/12345"

    expect(response.status).to eq(400)
  end
end

require 'rails_helper'

describe "return error on unnaceptable post request", :type => :request do

  before do
    post '/check', params: { street: '123 Test Ave',city: 'Portland',state: 'Oregon' }
  end

  it 'returns missing paramaters message' do
    expect(JSON.parse(response.body)['message']).to eq("Validation failed: Zip can't be blank")
  end

  it 'returns a not acceptable status' do
    expect(response).to have_http_status(:not_acceptable)
  end
end

require 'rails_helper'

describe "post a address via check route", :type => :request do

  before do
    post '/check', params: { street: '123 Test Ave',city: 'Portland',state: 'Oregon', zip: 97206, orders_checked: 100 }
  end

  it 'returns a address created message' do
    expect(JSON.parse(response.body)['message']).to eq("Address was not in database. It was created.")
  end

  it 'returns a ok status' do
    expect(response).to have_http_status(:created)
  end

  it 'returns address is already in database' do
    post '/check', params: { street: '123 Test Ave',city: 'Portland',state: 'Oregon', zip: 97206 }
    expect(JSON.parse(response.body)['message']).to eq("Address is in database. safety Low-Risk")
  end

  it 'return reports listed under the address' do
    post '/report', params: { street: '123 Test Ave',city: 'Portland',state: 'Oregon', zip: 97206, name: 'Bob', date: '12.20.2017', carrier: 'USPS', notes: 'Customer reported the package never arrived', code: 1, price: 9.99 }
    post '/check', params: { street: '123 Test Ave',city: 'Portland',state: 'Oregon', zip: 97206 }
    expect(JSON.parse(response.body)['reports']).to eq([{"name"=>"Bob", "date"=>"12.20.2017", "carrier"=>"USPS", "notes"=>"Customer reported the package never arrived", "code"=>1, "price"=>9.99}])
  end
end

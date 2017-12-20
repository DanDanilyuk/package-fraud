require 'rails_helper'

describe "post a report via report route", :type => :request do

  before do
    post '/check', params: { street: '123 Test Ave',city: 'Portland',state: 'Oregon', zip: 97206, orders_checked: 100 }
    post '/report', params: { street: '123 Test Ave',city: 'Portland',state: 'Oregon', zip: 97206, name: 'Bob', date: '12.20.2017', carrier: 'USPS', notes: 'Customer reported the package never arrived', code: 1, price: 9.99 }
  end

  it 'returns a report created message' do
    expect(JSON.parse(response.body)['message']).to eq("Your Report Has been Submitted. Thank You.")
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

  it 'return reports listed under the address' do
    expect(JSON.parse(response.body)['reports']).to eq([{"name"=>"Bob", "date"=>"12.20.2017", "carrier"=>"USPS", "notes"=>"Customer reported the package never arrived", "code"=>1, "price"=>9.99}])
  end

  it 'return reports listed under the address' do
    post '/report', params: { street: '1234 Test Ave', city: 'Portland', state: 'Oregon', zip: 97206, name: 'Bob', date: '12.20.2017', carrier: 'USPS', notes: 'Customer reported the package never arrived', code: 1, price: 9.99 }
    expect(JSON.parse(response.body)['message']).to eq("Your Report Has been Submitted. Thank You.")
  end
end

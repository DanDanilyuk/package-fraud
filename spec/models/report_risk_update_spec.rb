require 'rails_helper'

describe 'test responses of risk_checker method' do
  let!(:address) { FactoryBot.create(:address, risk: 0) }
  let!(:report1) { FactoryBot.create(:report, code: 1, price: 199.99, address_id: address.id) }
  let!(:report2) { FactoryBot.create(:report, code: 1, price: 999.99, address_id: address.id) }
  let!(:report3) { FactoryBot.create(:report, code: 4, address_id: address.id) }

  it 'Address risk to go up by 2 if code is 1 or 2' do
    report1.risk_update
    expect(report1.address.risk).to eq(2)
  end

  it 'Address risk to go up by 5 if code is 1 or 2 and price is over $500' do
    report2.risk_update
    expect(report2.address.risk).to eq(5)
  end

  it 'Address risk to go up by 1 if code is 3 or 4' do
    report3.risk_update
    expect(report3.address.risk).to eq(1)
  end

end

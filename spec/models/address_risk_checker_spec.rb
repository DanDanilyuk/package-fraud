require 'rails_helper'

describe 'test responses of risk_checker method' do
  let!(:address1) { FactoryBot.create(:address, orders_checked: 20, risk: 0) }
  let!(:address2) { FactoryBot.create(:address, street: '123 test st', orders_checked: 20, risk: 1) }
  let!(:address3) { FactoryBot.create(:address, street: '456 test st', orders_checked: 20, risk: 10) }


  it 'expect Low-Risk with < 5% risk to orders' do
    expect(address1.risk_checker).to eq('Low-Risk')
  end

  it 'expect Medium-Risk with > 5% but < 10% risk to orders' do
    expect(address2.risk_checker).to eq('Medium-Risk')
  end

  it 'expect High-Risk with > 10% risk to orders' do
    expect(address3.risk_checker).to eq('High-Risk')
  end

end

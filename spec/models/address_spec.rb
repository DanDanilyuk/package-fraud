require 'rails_helper'

describe Address, 'validation' do
  it { should validate_presence_of :street }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip }
  it { should validate_presence_of :orders_checked }
  it { should validate_presence_of :risk }
  it { should validate_uniqueness_of(:street).scoped_to([:city, :state, :zip]) }
end

describe Address, 'association' do
  it { should have_many :reports }
end

describe Address, 'column_specification' do
  it { should have_db_column(:street).of_type(:string) }
  it { should have_db_column(:city).of_type(:string) }
  it { should have_db_column(:state).of_type(:string) }
  it { should have_db_column(:zip).of_type(:integer) }
  it { should have_db_column(:orders_checked).of_type(:integer) }
  it { should have_db_column(:risk).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
end

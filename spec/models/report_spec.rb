require 'rails_helper'

describe Report, 'validation' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :date }
  it { should validate_presence_of :carrier }
  it { should validate_presence_of :notes }
  it { should validate_presence_of :code }
  it { should validate_presence_of :price }
  it { should validate_presence_of :address_id }
end

describe Report, 'association' do
  it { should belong_to :address }
end

describe Report, 'column_specification' do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:date).of_type(:string) }
  it { should have_db_column(:carrier).of_type(:string) }
  it { should have_db_column(:notes).of_type(:string) }
  it { should have_db_column(:code).of_type(:integer) }
  it { should have_db_column(:price).of_type(:float) }
  it { should have_db_column(:address_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
end

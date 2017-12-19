class Address < ApplicationRecord
  has_many :reports

  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true
  validates :orders_checked, :presence => true
  validates :risk, :presence => true

  validates_uniqueness_of :street, :scope => [:city, :state, :zip]
end

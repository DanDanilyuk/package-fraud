class Report < ApplicationRecord
  belongs_to :address

  validates :name, :presence => true
  validates :date, :presence => true
  validates :carrier, :presence => true
  validates :notes, :presence => true
  validates :code, :presence => true
  validates :price, :presence => true
end

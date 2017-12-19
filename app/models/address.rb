class Address < ApplicationRecord
  has_many :reports

  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true
  validates :orders_checked, :presence => true
  validates :risk, :presence => true

  validates_uniqueness_of :street, :scope => [:city, :state, :zip]

  def risk_checker
    if self.risk == 0 || ((self.risk.to_f / self.orders_checked.to_f) < 0.05)
      "Low-Risk"
    elsif (self.risk.to_f / self.orders_checked.to_f) >= 0.05 && (self.risk.to_f / self.orders_checked.to_f) <= 0.1
      "Medium-Risk"
    elsif (self.risk.to_f / self.orders_checked.to_f) > 0.1
      "High-Risk"
    end
  end

end

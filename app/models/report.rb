class Report < ApplicationRecord
  belongs_to :address

  validates :name, :presence => true
  validates :date, :presence => true
  validates :carrier, :presence => true
  validates :notes, :presence => true
  validates :code, :presence => true
  validates :price, :presence => true
  validates :address_id, :presence => true

  def risk_update
    @address = self.address
    if (self.code == 1 || self.code == 2) && (self.price < 500)
      @address.update(risk: (@address.risk +=2))
    elsif (self.code == 1 || self.code == 2) && (self.price > 500)
      @address.update(risk: (@address.risk +=5))
    else
      @address.update(risk: (@address.risk +=1))
    end
  end

end

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
    if self.code == 1||2
      @address.update(risk: (@address.risk +=2))
    else
      @address.update(risk: (@address.risk +=1))
    end
  end

end

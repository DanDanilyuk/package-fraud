class Address < ApplicationRecord
  has_many :reports

  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true


  before_save :upcase_fields
  before_save :standardize_address

   def upcase_fields
      self.street.upcase!
      self.city.upcase!
      self.state.upcase!
   end

  def standardize_address
    self.street.gsub!('ROAD','RD')
    self.street.gsub!('STREET','ST')
    self.street.gsub!('AVENUE','AVE')
    self.street.gsub!('NORTH','N')
    self.street.gsub!('SOUTH','S')
    self.street.gsub!('WEST','W')
    self.street.gsub!('EAST','E')
    self.street.gsub!('NORTHWEST','NW')
    self.street.gsub!('NORTHEAST','NE')
    self.street.gsub!('SOUTHEAST','SE')
    self.street.gsub!('SOUTHWEST','SW')
    self.state.gsub!('ALABAMA','AL')
    self.state.gsub!('ALASKA','AK')
    self.state.gsub!('ARIZONA','AZ')
    self.state.gsub!('ARKANSAS','AR')
    self.state.gsub!('CALIFORNIA','CA')
    self.state.gsub!('COLORADO','CO')
    self.state.gsub!('CONNECTICUT','CT')
    self.state.gsub!('CONNECTICUT','CT')
    self.state.gsub!('DELEWARE','DE')
    self.state.gsub!('FLORIDA','FL')
    self.state.gsub!('GEORGIA','GA')
    self.state.gsub!('HAWAII','HI')
    self.state.gsub!('IDAHO','ID')
    self.state.gsub!('ILLINOIS','IL')
    self.state.gsub!('INDIANA','IN')
    self.state.gsub!('IOWA','IA')
    self.state.gsub!('KANSAS','KS')
    self.state.gsub!('KENTUCKY','KY')
    self.state.gsub!('LOUISIANA','LA')
    self.state.gsub!('MAINE','ME')
    self.state.gsub!('MASSACHUSETTS','MA')
    self.state.gsub!('MICHIGAN','MI')
    self.state.gsub!('MINNESOTA','MN')
    self.state.gsub!('MISSISSIPPI','MS')
    self.state.gsub!('MISSOURI','MO')
    self.state.gsub!('MONTANA','MT')
    self.state.gsub!('NEBRASKA','NE')
    self.state.gsub!('NEVADA','NV')
    self.state.gsub!('NEW HAMPSHIRE','NH')
    self.state.gsub!('NEW JERSEY','NJ')
    self.state.gsub!('NEW MEXICO','NM')
    self.state.gsub!('NEW YORK','NY')
    self.state.gsub!('NORTH CAROLINA','NC')
    self.state.gsub!('NORTH DAKOTA','ND')
    self.state.gsub!('OHIO','OH')
    self.state.gsub!('OKLAHOMA','OK')
    self.state.gsub!('OREGON','OR')
    self.state.gsub!('PENNSYLVANIA','PA')
    self.state.gsub!('RHODE ISLAND','RI')
    self.state.gsub!('SOUTH CAROLINA','SC')
    self.state.gsub!('SOUTH DAKOTA','SW')
    self.state.gsub!('TENNESSEE','TN')
    self.state.gsub!('TEXAS','TX')
    self.state.gsub!('UTAH','UT')
    self.state.gsub!('VERMONT','VT')
    self.state.gsub!('VIRGINIA','VA')
    self.state.gsub!('WASHINGTON','WA')
    self.state.gsub!('WEST VIRGINIA','WV')
    self.state.gsub!('WISCONSIN','WI')
    self.state.gsub!('WYOMING','WY')
    self.state.gsub!('AMERICAN AMOA','AS')
    self.state.gsub!('DISTRICT OF COLUMBIA','DC')
    self.state.gsub!('FEDERATED STATES OF MICRONESIA','FM')
    self.state.gsub!('GUAM','GU')
    self.state.gsub!('MARSHALL ISLANDS','MH')
    self.state.gsub!('NORTHERN MARINA ISLANDS','MP')
    self.state.gsub!('PALAU','PW')
    self.state.gsub!('PUERTO RICO','PR')
    self.state.gsub!('VIRGIN ISLANDS','VI')
  end
end

class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    json_response(@addresses)
  end

  def show
    @address = Address.find(params[:id])
    json_response(@address)
  end
end

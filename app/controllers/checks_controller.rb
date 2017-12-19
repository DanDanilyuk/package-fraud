class ChecksController < ApplicationController
  def create
    standardize(checks_params)
    if @address = Address.where(street: checks_params[:street], city: checks_params[:city], state: checks_params[:state], zip: checks_params[:zip]).first
      @address.update(orders_checked: (@address.orders_checked + 1))
      render status: 201, json: { message: "Address is in database. Here is your report.",
                                        id: @address.id,
                                        rating: @address.street,
                                        content: @address.city,
                                        user_id: @address.state,
                                        destination_id: @address.zip,
                                        orders_checked: @address.orders_checked,
                                        risk: @address.risk }
    else
      @address = Address.create(street: checks_params[:street], city: checks_params[:city], state: checks_params[:state], zip: checks_params[:zip])
      render status: 201, json: { message: "Address was not in database. Here is your report.",
                                        id: @address.id,
                                        rating: @address.street,
                                        content: @address.city,
                                        user_id: @address.state,
                                        destination_id: @address.zip,
                                        orders_checked: @address.orders_checked,
                                        risk: @address.risk }
    end
  end

  def show
    @address = Address.find(params[:id])
    json_response([@address,@address.reports])
  end

  private

  def checks_params
    params.permit(:street, :city, :state, :zip)
  end
end

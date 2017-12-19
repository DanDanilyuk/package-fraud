class ReportsController < ApplicationController
  def create
    standardize(checks_params)
    if @address = Address.where(street: checks_params[:street], city: checks_params[:city], state: checks_params[:state], zip: checks_params[:zip]).first
      @address.update(orders_checked: (@address.orders_checked + 1))
    else
      @address = Address.create(street: reports_params[:street], city: reports_params[:city], state: reports_params[:state], zip: reports_params[:zip])
    end
    @report = Report.create(name: reports_params[:name], date: reports_params[:date], carrier: reports_params[:carrier], notes: reports_params[:notes], code: reports_params[:code], price: reports_params[:price], address_id: @address.id)
    @report.risk_update
    json_response(@report)
  end

  private

  def checks_params
    params.permit(:street, :city, :state, :zip)
  end

  def reports_params
    params.permit(:name, :date, :carrier, :notes, :code, :price)
  end
end

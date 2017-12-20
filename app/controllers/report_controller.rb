class ReportController < ApplicationController
  def create
    standardize(checks_params)
    if @address = Address.where(street: checks_params[:street], city: checks_params[:city], state: checks_params[:state], zip: checks_params[:zip]).first
    else
      @address = Address.create!(street: checks_params[:street], city: checks_params[:city], state: checks_params[:state], zip: checks_params[:zip])
    end
    @report = Report.create!(name: reports_params[:name], date: reports_params[:date], carrier: reports_params[:carrier], notes: reports_params[:notes], code: reports_params[:code], price: reports_params[:price], address_id: @address.id)
    @report.risk_update
    @safety = @address.risk_checker
    @reports = []
    @address.reports.each do |report|
      @reports.push(name: report.name,date: report.date,carrier: report.carrier,notes: report.notes,code: report.code,price: report.price)
    end
    render status: 201, json: { message: "Your Report Has been Submitted. Thank You.",
                                id: @report.id,
                                safety_level: @safety,
                                street: @address.street,
                                city: @address.city,
                                state: @address.state,
                                zip: @address.zip,
                                orders_checked: @address.orders_checked,
                                risk: @address.risk,
                                reported_name: @report.name,
                                reported_date: @report.date,
                                reported_carrier: @report.carrier,
                                reported_notes: @report.notes,
                                reported_code: @report.code,
                                reported_price: @report.price,
                                reports: @reports }
  end

  private

  def checks_params
    params.permit(:street, :city, :state, :zip)
  end

  def reports_params
    params.permit(:name, :date, :carrier, :notes, :code, :price)
  end
end

class ChecksController < ApplicationController
  def create
    standardize(checks_params)
    if @address = Address.where(street: checks_params[:street], city: checks_params[:city], state: checks_params[:state], zip: checks_params[:zip]).first
      @address.update!(orders_checked: (@address.orders_checked + 1))
      @safety = @address.risk_checker
      if @address.reports == []
        render status: 200, json: { message: "Address is in database. safety #{@safety}",
                                          id: @address.id,
                                          safety_level: @safety,
                                          street: @address.street,
                                          city: @address.city,
                                          state: @address.state,
                                          zip: @address.zip,
                                          orders_checked: @address.orders_checked,
                                          risk: @address.risk,
                                          reports: 'No Reports' }
      else
        @reports = []
        @address.reports.each do |report|
          @reports.push(name: report.name,date: report.date,carrier: report.carrier,notes: report.notes,code: report.code,price: report.price)
        end
        render status: 200, json: { message: "Address is in database. safety #{@safety}",
                                          id: @address.id,
                                          safety_level: @safety,
                                          street: @address.street,
                                          city: @address.city,
                                          state: @address.state,
                                          zip: @address.zip,
                                          orders_checked: @address.orders_checked,
                                          risk: @address.risk,
                                          reports: @reports }
      end
    else
      @address = Address.create!(street: checks_params[:street], city: checks_params[:city], state: checks_params[:state], zip: checks_params[:zip])
      render status: 201, json: { message: "Address was not in database. It was created.",
                                  id: @address.id,
                                  safety_level: "Low-Risk",
                                  street: @address.street,
                                  city: @address.city,
                                  state: @address.state,
                                  zip: @address.zip,
                                  orders_checked: @address.orders_checked,
                                  risk: @address.risk,
                                  reports: 'No Reports' }
    end
  end

  private

  def checks_params
    params.permit(:street, :city, :state, :zip)
  end
end

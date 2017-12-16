class ReportsController < ApplicationController
  def index
    @reports = Report.all
    json_response(@reports)
  end

  def show
    @report = Report.find(params[:id])
    json_response(@report)
  end
end

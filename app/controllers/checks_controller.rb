class ChecksController < ApplicationController
  def index
    @reports = Report.all
    json_response(@reports)
  end

  def show
    @report = Report.find(params[:id])
    @address = @report.address
    json_response(@report)
  end

  private

  def report_params
    params.permit(:rating, :content, :user_id, :destination_id)
  end
end

create_table "addresses", force: :cascade do |t|
  t.string "street"
  t.string "city"
  t.string "state"
  t.integer "zip"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end

create_table "reports", force: :cascade do |t|
  t.string "name"
  t.string "date"
  t.string "carrier"
  t.string "notes"
  t.integer "code"
  t.float "price"
  t.integer "address_id"

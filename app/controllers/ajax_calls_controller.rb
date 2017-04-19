class AjaxCallsController < ApplicationController
  require 'date'
  before_action :authenticate
  layout 'blank'

  def load_electrical
    variable = params[:variable]
    units = params[:units]
    @result = ElectricalMeasurement.last[variable]
    if variable.downcase == "energy_med1"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_med1 != 0"
      max_current_month = ElectricalMeasurement.where(query, Time.now.month, Time.now.year ).maximum(variable)
      min_current_month = ElectricalMeasurement.where(query, Time.now.month, Time.now.year ).minimum(variable)
      @result = max_current_month - min_current_month
      #monthly_energy = {}
      #(1..12).to_a.each do |month|
      #    min_month = ElectricalMeasurement.where(query, month, Time.now.year ).minimum(variable)
      #    max_month = ElectricalMeasurement.where(query, month, Time.now.year ).minimum(variable)
      #    monthly_energy[Date::MONTHNAMES[month]] = max_month - min_month
      #end
    end
    if variable.downcase == "total_delivered_energy"
      @result = ElectricalMeasurement.maximum("energy_med1")
      timestamp = "Since August 2016"
    end
    @result = "#{@result} #{units(variable)}" if units
    if @result.blank?
      @result = 'N/A'
    end
    render json: { result: @result, variable: variable, timestamp: timestamp }, layout: true
  end

  def load_internal
    variable = params[:variable]
    units = params[:units]
    @result = InternalConditionsMeasurement.last[variable]
    @result = "#{@result.to_i}#{units(variable)}" if units
    timestamp = InternalConditionsMeasurement.last.created_at.strftime("%F %T")
    if @result.blank?
      @result = 'N/A'
    end
    case variable
    when "temperature_int"
      variable = "internal_temperature"
    when "humidity_int"
      variable = "internal_humidity"
    end
    render json: { result: @result, variable: variable, timestamp: timestamp }, layout: true
  end

  def load_metereological
    variable = params[:variable]
    units = params[:units]
    @result = MeteorologicalMeasurement.last[variable]
    @result =  "<h3>#{@result.to_i}</h3>" if variable != "temperature"
    if @result.blank?
      @result = 'N/A'
    end
    render json: { result: @result, variable: variable }, layout: true
  end

  private
    def authenticate
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        username == 'admin' && password == 'uninorte'
      end
    end
end

class MeasurementsController < ApplicationController
  before_action :authenticate
  layout 'blank'

  def new_electrical
    accepted = {}
    accepted[:voltage_med1] = params[:voltage_med1]
    accepted[:current_med1] = params[:current_med1]
    accepted[:energy_med1] = params[:energy_med1]
    accepted[:power_med1] = params[:power_med1]
    accepted[:pf_med1] = params[:pf_med1]
    accepted[:voltage_batt1] = params[:voltage_batt1]
    accepted[:voltage_batt2] = params[:voltage_batt2]
    @electrical_measurement = ElectricalMeasurement.new(accepted)
    attempt = @electrical_measurement.save
    if attempt
      render html: "ElectricalMeasurements #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_internal_conditions
    accepted = {}
    accepted[:temperature_int] = params[:temperature_int]
    accepted[:humidity_int] = params[:humidity_int]
    @internal_conditions_measurement = InternalConditionsMeasurement.new(accepted)
    attempt = @internal_conditions_measurement.save
    if attempt
      render html: "InternalConditionsMeasurements #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_meteorological
    accepted = {}
    accepted[:temperature] = params[:temperature]
    accepted[:humidity] = params[:humidity]
    accepted[:wind_speed] = params[:wind_speed]
    accepted[:uv_index] = params[:uv_index]
    accepted[:solar_radiation] = params[:solar_radiation]
    accepted[:wind_direction] = params[:wind_direction]
    @meteorological_measurement = MeteorologicalMeasurement.new(accepted)
    attempt = @meteorological_measurement.save
    if attempt
      render html: "MeteorologicalMeasurements #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_wunderground
    station_id = 'IATLNTIC4'
    w_info = open("http://api.wunderground.com/api/606f3f6977348613/conditions/q/pws:#{station_id}.json")
    data = JSON.parse(w_info.read)["current_observation"]
    redirect_to controller: 'measurements', action: 'new_meteorological',
                temperature: data["temp_c"], humidity: data["relative_humidity"],
                wind_speed: data["wind_kph"], uv_index: data["UV"],
                solar_radiation: data["solarradiation"], wind_direction: data["wind_degrees"]
  end

  private
    def authenticate
      if request.content_type.to_s.downcase != "Basic YWRtaW46dW5pbm9ydGU=".downcase
        authenticate_or_request_with_http_basic('Administration') do |username, password|
          username == 'admin' && password == 'uninorte'
        end
      end
    end
end

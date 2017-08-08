class MeteorologicalMeasurement < ApplicationRecord
  before_save :default_values
  protected
    def default_values
      self.humidity ||= 0
      self.temperature ||= 0
      self.solar_radiation ||= 0
      self.uv_index ||= 0
      self.wind_direction ||= 0
      self.wind_speed ||= 0
    end
end

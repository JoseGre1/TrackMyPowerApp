class InternalConditionsMeasurement < ApplicationRecord
  before_save :default_values
  protected
    def default_values
      self.humidity_int ||= 0
      self.temperature_int ||= 0
    end
end

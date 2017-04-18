class ElectricalMeasurement < ApplicationRecord
  before_save :default_values
  protected
    def default_values
      self.voltage_med1 ||= 0
      self.current_med1 ||= 0
      self.energy_med1 ||= 0
      self.power_med1 ||= 0
      self.pf_med1 ||= 0
      self.voltage_batt1 ||= 0
      self.voltage_batt2 ||= 0
    end
end

class ElectricalMeasurement < ApplicationRecord
  before_save :low_voltage_adjustment
  before_save :crazy_energy_adjustment
  before_save :default_values
  protected
    def low_voltage_adjustment
      if !self.voltage_med1.nil?
        if self.voltage_med1 <= 1
          self.voltage_med1 = 0
          self.current_med1 = 0
          self.power_med1 = 0
          self.energy_med1 = self.class.maximum("energy_med1")
          self.pf_med1 = 1
        end
      end
    end
    
    def crazy_energy_adjustment
      if self.energy_med1 > 99999
        self.energy_med1 = self.class.maximum("energy_med1")
      end
    end
    
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

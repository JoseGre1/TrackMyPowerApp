class PanelConditionMeasurement < ApplicationRecord
	before_save :default_values
  protected
    def default_values
          self.temp_ext ||= 0
          self.temp_panel ||= 0
          self.radiation ||= 0
     end
end

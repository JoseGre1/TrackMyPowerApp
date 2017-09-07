class PanelCondition < ApplicationRecord
  before_save :panel_condition
  protected
    def panel_condition
          self.temp_ext = 0
          self.temp_panel = 0
          self.radiation = 0
     end
end

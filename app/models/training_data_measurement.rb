class TrainingDataMeasurement < ApplicationRecord
	 before_save :default_values
  protected
    def default_values
      self.x ||= 0
      self.y ||= 0
      self.z||= 0
      self.label ||= 0
      self.session ||= 0 
      self.user ||= 0 
    end
end

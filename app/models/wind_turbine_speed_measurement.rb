class WindTurbineSpeedMeasurement < ApplicationRecord
	before_save :default_values
	protected 
	def default_values
		self.rpm ||= 0
	end 
end

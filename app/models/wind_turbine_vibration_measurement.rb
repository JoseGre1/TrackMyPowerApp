class WindTurbineVibrationMeasurement < ApplicationRecord
	before_save :default_values
	protected
	def default_values
		self.m_ejex ||= 0
		self.m_ejey ||= 0
		self.m_ejez ||= 0
	end 
end

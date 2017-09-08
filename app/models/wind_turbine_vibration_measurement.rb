class WindTurbineVibrationMeasurement < ApplicationRecord
	before_save :default_values
	protected
	def default_values
		self.max_ejex ||= 0
		self.m_ejex ||= 0
		self.min_ejex ||= 0
		self.max_ejey ||= 0
		self.m_ejey ||= 0
		self.min_ejey ||= 0
		self.max_ejez ||= 0
		self.m_ejez ||= 0
		self.min_ejez ||= 0
	end 
end

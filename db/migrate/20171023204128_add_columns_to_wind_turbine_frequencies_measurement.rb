class AddColumnsToWindTurbineFrequenciesMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :wind_turbine_frequencies_measurements, :mag, :float
    add_column :wind_turbine_frequencies_measurements, :freq, :int
  end
end

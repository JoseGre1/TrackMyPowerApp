class AddColumnToWindTurbineSpeedMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :wind_turbine_speed_measurements, :rpm, :integer
  end
end

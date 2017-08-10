class AddColumnsToMeteorologicalMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :meteorological_measurements, :temperature, :float
    add_column :meteorological_measurements, :humidity, :float
    add_column :meteorological_measurements, :wind_speed, :float
    add_column :meteorological_measurements, :uv_index, :float
    add_column :meteorological_measurements, :solar_radiation, :float
    add_column :meteorological_measurements, :wind_direction, :float
  end
end

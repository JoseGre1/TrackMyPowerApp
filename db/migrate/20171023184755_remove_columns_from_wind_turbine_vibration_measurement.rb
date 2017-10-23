class RemoveColumnsFromWindTurbineVibrationMeasurement < ActiveRecord::Migration[5.0]
  def change
    remove_column :wind_turbine_vibration_measurements, :max_ejex, :float
    remove_column :wind_turbine_vibration_measurements, :min_ejex, :float
    remove_column :wind_turbine_vibration_measurements, :max_ejey, :float
    remove_column :wind_turbine_vibration_measurements, :min_ejey, :float
    remove_column :wind_turbine_vibration_measurements, :max_ejez, :float
    remove_column :wind_turbine_vibration_measurements, :min_ejez, :float
  end
end

class AddColumnsToWindTurbineVibrationMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :wind_turbine_vibration_measurements, :max_ejex, :float
    add_column :wind_turbine_vibration_measurements, :m_ejex, :float
    add_column :wind_turbine_vibration_measurements, :min_ejex, :float
    add_column :wind_turbine_vibration_measurements, :max_ejey, :float
    add_column :wind_turbine_vibration_measurements, :m_ejey, :float
    add_column :wind_turbine_vibration_measurements, :min_ejey, :float
    add_column :wind_turbine_vibration_measurements, :max_ejez, :float
    add_column :wind_turbine_vibration_measurements, :m_ejez, :float
    add_column :wind_turbine_vibration_measurements, :min_ejez, :float
  end
end

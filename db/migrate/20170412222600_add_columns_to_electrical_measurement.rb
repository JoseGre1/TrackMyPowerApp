class AddColumnsToElectricalMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :electrical_measurements, :voltage_med1, :float
    add_column :electrical_measurements, :current_med1, :float
    add_column :electrical_measurements, :energy_med1, :float
    add_column :electrical_measurements, :power_med1, :float
    add_column :electrical_measurements, :pf_med1, :float
    add_column :electrical_measurements, :voltage_batt1, :float
    add_column :electrical_measurements, :voltage_batt2, :float
  end
end

class AddColumnsToInternalConditionsMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :internal_conditions_measurements, :temperature_int, :float
    add_column :internal_conditions_measurements, :humidity_int, :float
  end
end

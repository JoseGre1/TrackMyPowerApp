class AddColumnsToPanelConditionMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :panel_condition_measurements, :temp_ext, :float
    add_column :panel_condition_measurements, :temp_panel, :float
    add_column :panel_condition_measurements, :radiation, :float
  end
end

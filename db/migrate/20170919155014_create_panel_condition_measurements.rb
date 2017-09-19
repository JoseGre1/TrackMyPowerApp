class CreatePanelConditionMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :panel_condition_measurements do |t|

      t.timestamps
    end
  end
end

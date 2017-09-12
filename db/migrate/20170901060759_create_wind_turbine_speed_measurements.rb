class CreateWindTurbineSpeedMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :wind_turbine_speed_measurements do |t|

      t.timestamps
    end
  end
end

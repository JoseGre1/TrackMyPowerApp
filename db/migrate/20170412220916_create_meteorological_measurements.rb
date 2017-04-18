class CreateMeteorologicalMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :meteorological_measurements do |t|

      t.timestamps
    end
  end
end

class CreateElectricalMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :electrical_measurements do |t|

      t.timestamps
    end
  end
end

class CreateTrainingDataMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :training_data_measurements do |t|

      t.timestamps
    end
  end
end

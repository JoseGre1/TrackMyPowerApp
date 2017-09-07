class AddColumnsToTrainingDataMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :training_data_measurements, :x, :double
    add_column :training_data_measurements, :y, :double
    add_column :training_data_measurements, :z, :double
    add_column :training_data_measurements, :label, :string
  end
end

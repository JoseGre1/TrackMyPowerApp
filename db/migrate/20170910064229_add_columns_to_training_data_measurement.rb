class AddColumnsToTrainingDataMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :training_data_measurements, :x, :float
    add_column :training_data_measurements, :y, :float
    add_column :training_data_measurements, :z, :float
    add_column :training_data_measurements, :label, :string
  end
end

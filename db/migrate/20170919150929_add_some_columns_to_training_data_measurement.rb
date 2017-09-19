class AddSomeColumnsToTrainingDataMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :training_data_measurements, :user, :integer
    add_column :training_data_measurements, :session, :integer
  end
end

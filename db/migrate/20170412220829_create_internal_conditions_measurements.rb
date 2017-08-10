class CreateInternalConditionsMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_conditions_measurements do |t|

      t.timestamps
    end
  end
end

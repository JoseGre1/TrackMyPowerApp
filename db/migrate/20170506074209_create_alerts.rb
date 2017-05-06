class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.references :user, foreign_key: true
      t.string :type
      t.string :variable
      t.string :comparator
      t.float :value1
      t.float :value2
      t.boolean :enabled?
      t.boolean :email?

      t.timestamps
    end
  end
end

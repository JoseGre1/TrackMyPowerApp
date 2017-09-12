class CreatePanelConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :panel_conditions do |t|
      t.float :temp_ext
      t.float :temp_panel
      t.float :radiation

      t.timestamps
    end
  end
end

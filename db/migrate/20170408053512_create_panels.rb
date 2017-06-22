class CreatePanels < ActiveRecord::Migration[5.0]
  def change
    create_table :panels do |t|

      t.timestamps
    end
  end
end

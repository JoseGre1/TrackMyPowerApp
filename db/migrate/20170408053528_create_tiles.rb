class CreateTiles < ActiveRecord::Migration[5.0]
  def change
    create_table :tiles do |t|

      t.timestamps
    end
  end
end

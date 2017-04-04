class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.string :title
      t.string :subtitle
      t.string :description
      t.boolean :minimizable
      t.boolean :closable
      t.boolean :movable
      t.integer :pos_x
      t.integer :pos_y
      t.integer :size_x
      t.integer :size_y

      t.timestamps
    end
  end
end

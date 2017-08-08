class AddSomeColumnsToPanels < ActiveRecord::Migration[5.0]
  def change
    add_column :panels, :subtitle, :string
    add_column :panels, :minimizable, :boolean
    add_column :panels, :closable, :boolean
    add_column :panels, :movable, :boolean
    add_column :panels, :pos_x, :integer
    add_column :panels, :pos_y, :integer
    add_column :panels, :size_x, :integer
    add_column :panels, :size_y, :integer
  end
end

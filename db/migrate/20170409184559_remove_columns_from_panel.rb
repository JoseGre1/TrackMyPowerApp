class RemoveColumnsFromPanel < ActiveRecord::Migration[5.0]
  def change
    remove_column :panels, :pos_x, :integer
    remove_column :panels, :pos_y, :integer
    remove_column :panels, :size_x, :integer
    remove_column :panels, :size_y, :integer
    add_column :panels, :order, :integer
    add_column :panels, :width, :integer
  end
end

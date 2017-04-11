class AddColumnOrderToRow < ActiveRecord::Migration[5.0]
  def change
    add_column :rows, :order, :integer
  end
end

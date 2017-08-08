class AddOrderToTile < ActiveRecord::Migration[5.0]
  def change
    add_column :tiles, :order, :integer
  end
end

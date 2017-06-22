class AddIconToTile < ActiveRecord::Migration[5.0]
  def change
    add_column :tiles, :icon, :string
  end
end

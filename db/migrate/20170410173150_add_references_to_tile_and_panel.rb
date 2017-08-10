class AddReferencesToTileAndPanel < ActiveRecord::Migration[5.0]
  def change
    add_reference(:tiles, :page, foreign_key: true)
    add_reference(:panels, :row, foreign_key: true)
  end
end

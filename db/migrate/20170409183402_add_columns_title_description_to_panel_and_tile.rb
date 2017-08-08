class AddColumnsTitleDescriptionToPanelAndTile < ActiveRecord::Migration[5.0]
  def change
    add_column :panels, :title, :string
    add_column :panels, :description, :string
    add_column :tiles, :title, :string
    add_column :tiles, :description, :string
  end
end

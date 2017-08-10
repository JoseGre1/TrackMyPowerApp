class AddDropdownToNavbarmaintab < ActiveRecord::Migration[5.0]
  def change
    add_column :navbar_main_tabs, :dropdown, :boolean
    add_column :navbar_main_tabs, :link, :string
    add_column :navbar_sub_tabs, :link, :string
  end
end

class AddReferenceToNavbarmaintabDashboard < ActiveRecord::Migration[5.0]
  def change
    add_reference(:navbar_main_tabs, :dashboard, foreign_key: true)
  end
end

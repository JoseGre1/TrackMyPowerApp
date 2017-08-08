class DeleteReferenceToNavbarmaintabDashboard < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:navbar_main_tabs, :dashboard, foreign_key: true)
  end
end

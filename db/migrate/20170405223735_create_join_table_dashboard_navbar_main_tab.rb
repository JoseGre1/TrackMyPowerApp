class CreateJoinTableDashboardNavbarMainTab < ActiveRecord::Migration[5.0]
  def change
    create_join_table :dashboards, :navbar_main_tabs do |t|
    end
  end
end

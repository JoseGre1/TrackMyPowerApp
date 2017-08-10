class AddReferencePagesDashboard < ActiveRecord::Migration[5.0]
  def change
    add_reference(:pages, :dashboard, foreign_key: true)
  end
end

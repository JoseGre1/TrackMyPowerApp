class AddReferenceToUsersDashboard < ActiveRecord::Migration[5.0]
  def change
    add_reference(:users, :dashboard, foreign_key: true)
  end
end

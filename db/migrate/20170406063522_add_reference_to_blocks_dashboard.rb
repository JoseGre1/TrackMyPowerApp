class AddReferenceToBlocksDashboard < ActiveRecord::Migration[5.0]
  def change
    add_reference(:blocks, :dashboard, foreign_key: true)
  end
end

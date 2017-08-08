class AddColumnsToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :type, :string
    add_reference(:notifications, :user, foreign_key: true)
  end
end

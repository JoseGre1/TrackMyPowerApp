class AddColumnToNotificationEmail < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :email, :boolean
  end
end

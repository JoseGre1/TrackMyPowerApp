class AddColumnsSourceSeenNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :seen, :boolean
    add_column :notifications, :source_id, :integer
    remove_column :alerts, :enabled?, :boolean
    add_column :alerts, :enabled, :boolean
    remove_column :alerts, :email?, :boolean
    add_column :alerts, :email, :boolean
  end
end

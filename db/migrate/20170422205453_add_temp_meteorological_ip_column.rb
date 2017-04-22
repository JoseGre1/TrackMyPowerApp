class AddTempMeteorologicalIpColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :meteorological_measurements, :ip_server, :string
  end
end

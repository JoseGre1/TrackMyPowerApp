# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Router
  include Rails.application.routes.url_helpers

  def self.default_url_options
    ActionMailer::Base.default_url_options
  end
end

router = Router.new

#[description]
dashboard_list = [
  'Default',
  'Guest'
]

dashboard_list.each do |description|
  Dashboard.create( description: description )
end

default_dashboard = Dashboard.find_by(description: "Default")
guest_dashboard = Dashboard.find_by(description: "Guest")

#[title, icon, dropdown, link]
navbar_main_tab_list = [
  [ "Dashboard", "fa fa-tachometer", false, "/dashboard" ],
  [ "Charts and Stats", "fa fa-bar-chart-o", true, "javascript:;" ],
  [ "Export", "fa fa-download", true, "javascript:;" ],
  [ "Alerts", "fa fa-bell", false, "/alerts" ]
]

navbar_main_tab_list.each do |title, icon, dropdown, link|
  NavbarMainTab.create( title: title, icon: icon, dropdown: dropdown, link: link )
  NavbarMainTab.find_by(title: title).dashboard << default_dashboard
  NavbarMainTab.find_by(title: title).dashboard << guest_dashboard
  if (!dropdown)
    Page.create(title: title, description: title,
                navbar_tab: NavbarMainTab.find_by(title: title),
                dashboard: default_dashboard)
    Page.create(title: title, description: title,
                navbar_tab: NavbarMainTab.find_by(title: title),
                dashboard: guest_dashboard)
  end
end

#[title, navbar_main_tab, link]
navbar_sub_tab_list = [
  [ "Data Charts", NavbarMainTab.find_by(title: "Charts and Stats"), "/charts/data" ],
  [ "Tables", NavbarMainTab.find_by(title: "Export"), "/export/tables" ]
]

navbar_sub_tab_list.each do |title, navbar_main_tab, link|
  NavbarSubTab.create( title: title, navbar_main_tab: navbar_main_tab, link: link )
  Page.create(title: title, description: title,
              navbar_tab: NavbarSubTab.find_by(title: title),
              dashboard: default_dashboard)
  Page.create(title: title, description: title,
              navbar_tab: NavbarSubTab.find_by(title: title),
              dashboard: guest_dashboard)
end

# TILES:
#   [page, title, icon, description, order]
def create_general_tiles(dashboard)
  tiles_list = [
    [Page.find_by(title: "Dashboard", dashboard: dashboard), "Last Update", "fa fa-refresh", "Last Update", 1],
    [Page.find_by(title: "Dashboard", dashboard: dashboard), "Internal Humidity", "wi wi-humidity", "Internal Humidity", 2],
    [Page.find_by(title: "Dashboard", dashboard: dashboard), "Internal Temperature", "wi wi-thermometer", "Internal Temperature", 3],
    [Page.find_by(title: "Dashboard", dashboard: dashboard), "Total Delivered Energy", "fa fa-plug", "Total Delivered Energy", 4]
  ]
  tiles_list.each do |page, title, icon, description, order|
    Tile.create(title:title, description:description, icon: icon, order: order, page: page)
  end
end

create_general_tiles(default_dashboard)
create_general_tiles(guest_dashboard)

# ROWS:
#   [page, capacity, height, order]
def create_general_rows(dashboard)
  rows_list = [
    [Page.find_by(title: "Dashboard", dashboard: dashboard), 2, 420, nil],
    [Page.find_by(title: "Dashboard", dashboard: dashboard), 3, 340, nil],
    [Page.find_by(title: "Data Charts", dashboard: dashboard), 1, 370, nil],
    [Page.find_by(title: "Data Charts", dashboard: dashboard), 1, 370, nil],
    [Page.find_by(title: "Data Charts", dashboard: dashboard), 2, 370, nil],
    [Page.find_by(title: "Data Charts", dashboard: dashboard), 2, 370, nil],
    [Page.find_by(title: "Tables", dashboard: dashboard), 1, nil, nil],
    [Page.find_by(title: "Tables", dashboard: dashboard), 1, nil, nil],
    [Page.find_by(title: "Alerts", dashboard: dashboard), 1, nil, nil],
    [Page.find_by(title: "Alerts", dashboard: dashboard), 1, nil, nil]
  ]

  rows_list.each do |page, capacity, height, order|
    Row.create(page: page, capacity: capacity, height: height, order: order)
  end
end

create_general_rows(default_dashboard)
create_general_rows(guest_dashboard)

# # PANELS:
# #   [row, title, subtitle, description, width, order, movable, minimizable, closable]
def create_general_panels(dashboard)
  panels_list = [
    [Row.find_by(order: 1, page: Page.find_by(title:"Dashboard", dashboard: dashboard)), "Electrical Variables", nil, nil, 4, nil, nil, nil, nil ],
    [Row.find_by(order: 1, page: Page.find_by(title:"Dashboard", dashboard: dashboard)), "Location", "Uninorte km5 - Bloque K - Mapuka", nil, 8, nil, nil, nil, nil ],
    [Row.find_by(order: 2, page: Page.find_by(title:"Dashboard", dashboard: dashboard)), "Weather Report", nil, nil, 4, 1, nil, nil, nil ],
    [Row.find_by(order: 2, page: Page.find_by(title:"Dashboard", dashboard: dashboard)), "Panel Conditions", nil, nil, 4, 3, nil, nil, nil ],
    [Row.find_by(order: 1, page: Page.find_by(title:"Data Charts", dashboard: dashboard)), "Voltage", "last 2 days",  nil, 12, nil, nil, nil, nil ],
    [Row.find_by(order: 2, page: Page.find_by(title:"Data Charts", dashboard: dashboard)), "Energy", "monthly", nil, 12, nil, nil, nil, nil ],
    [Row.find_by(order: 3, page: Page.find_by(title:"Data Charts", dashboard: dashboard)), "Wind", "last 3 days", nil, 6, nil, nil, nil, nil ],
    [Row.find_by(order: 3, page: Page.find_by(title:"Data Charts", dashboard: dashboard)), "PSH", "last 7 days", nil, 6, nil, nil, nil, nil ],
    [Row.find_by(order: 4, page: Page.find_by(title:"Data Charts", dashboard: dashboard)), "Panel Temperature", "last 7 days", nil, 6, nil, nil, nil, nil ],
    [Row.find_by(order: 4, page: Page.find_by(title:"Data Charts", dashboard: dashboard)), "Panel PSH", "last 7 days", nil, 6, nil, nil, nil, nil ],
    [Row.find_by(order: 1, page: Page.find_by(title:"Tables", dashboard: dashboard)), "Tables", "filter results", nil, 12, nil, nil, nil, nil ],
    [Row.find_by(order: 2, page: Page.find_by(title:"Tables", dashboard: dashboard)), "Graphics", nil, 12, nil, nil, nil, nil ],
    [Row.find_by(order: 1, page: Page.find_by(title:"Alerts", dashboard: dashboard)), "Notifications", nil, nil, 12, nil, nil, nil, nil ],
    [Row.find_by(order: 2, page: Page.find_by(title:"Alerts", dashboard: dashboard)), "Settings", nil, nil, 12, nil, nil, nil, nil ]
  ]

  panels_list.each do |row, title, subtitle, description, width, order, movable, minimizable, closable|
    Panel.create(row: row, title: title, subtitle: subtitle, description: description, width: width,
                 order: order, movable: movable, minimizable: minimizable, closable: closable)
  end
end

create_general_panels(default_dashboard)
create_general_panels(guest_dashboard)

panels_list_default = [
    [Row.find_by(order: 2, page: Page.find_by(title:"Dashboard", dashboard: default_dashboard)), "Control Panel", nil, nil, 4, 2, nil, nil, nil ]
]

panels_list_default.each do |row, title, subtitle, description, width, order, movable, minimizable, closable|
  Panel.create(row: row, title: title, subtitle: subtitle, description: description, width: width,
               order: order, movable: movable, minimizable: minimizable, closable: closable)
end

#Create Users for RPi, Arduino, TrackMyPowerApp
User.create(name: "José Hernández", email: "josegre.95@hotmail.com", password: "jose1234", password_confirmation: "jose1234", username: "JoseGre1", dashboard: default_dashboard)
User.create(name: "Raspberry Pi", email: "raspberrypi_uninorte@track-mypower.tk", password: "raspberrypi1234", password_confirmation: "raspberrypi1234", username: "RaspberryPi", dashboard: default_dashboard)
User.create(name: "Arduino", email: "arduino_uninorte@track-mypower.tk", password: "arduino1234", password_confirmation: "arduino1234", username: "Arduino", dashboard: default_dashboard)
User.create(name: "System", email: "service@track-mypower.tk", password: "system1234", password_confirmation: "system1234", username: "System", dashboard: default_dashboard)

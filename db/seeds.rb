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
  'Blank'
]

dashboard_list.each do |description|
  Dashboard.create( description: description )
end

default_dashboard = Dashboard.find_by(description: "Default")
blank_dashboard = Dashboard.find_by(description: "Blank")

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
  NavbarMainTab.find_by(title: title).dashboard << blank_dashboard
  if (!dropdown)
    Page.create(title: title, description: title,
                navbar_tab: NavbarMainTab.find_by(title: title),
                dashboard: default_dashboard)
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
end

# TILES:
#   [page, title, icon, description, order]
tiles_list = [
  [Page.find_by(title: "Dashboard", dashboard: default_dashboard), "Internal Humidity", "wi wi-humidity", "Internal Humidity", 1],
  [Page.find_by(title: "Dashboard", dashboard: default_dashboard), "Internal Temperature", "wi wi-thermometer", "Internal Temperature", 2],
  [Page.find_by(title: "Dashboard", dashboard: default_dashboard), "Total Delivered Energy", "fa fa-plug", "Total Delivered Energy", 3]
]

tiles_list.each do |page, title, icon, description, order|
  Tile.create(title:title, description:description, icon: icon, order: order, page: page)
end

# ROWS:
#   [page, capacity, height, order]
rows_list = [
  [Page.find_by(title: "Dashboard", dashboard: default_dashboard), 2, 420, nil],
  [Page.find_by(title: "Dashboard", dashboard: default_dashboard), 3, 340, nil],
  [Page.find_by(title: "Data Charts", dashboard: default_dashboard), 1, 370, nil],
  [Page.find_by(title: "Data Charts", dashboard: default_dashboard), 1, 370, nil],
  [Page.find_by(title: "Data Charts", dashboard: default_dashboard), 2, 370, nil],
  [Page.find_by(title: "Tables", dashboard: default_dashboard), 1, nil, nil],
]

rows_list.each do |page, capacity, height, order|
  Row.create(page: page, capacity: capacity, height: height, order: order)
end

# # PANELS:
# #   [row, title, subtitle, description, width, order, movable, minimizable, closable]
panels_list = [
  [Row.find_by(order: 1, page: Page.find_by(title:"Dashboard")), "Electrical Variables", nil, nil, 4, nil, nil, nil, nil ],
  [Row.find_by(order: 1, page: Page.find_by(title:"Dashboard")), "Location", "Uninorte km5 - Bloque K - Mapuka", nil, 8, nil, nil, nil, nil ],
  [Row.find_by(order: 2, page: Page.find_by(title:"Dashboard")), "Weather Report", nil, nil, 4, nil, nil, nil, nil ],
  [Row.find_by(order: 2, page: Page.find_by(title:"Dashboard")), "Control Panel", nil, nil, 4, nil, nil, nil, nil ],
  [Row.find_by(order: 2, page: Page.find_by(title:"Dashboard")), "Live Stream", nil, nil, 4, nil, nil, nil, nil ],
  [Row.find_by(order: 1, page: Page.find_by(title:"Data Charts")), "Voltage", "last 2 days",  nil, 12, nil, nil, nil, nil ],
  [Row.find_by(order: 2, page: Page.find_by(title:"Data Charts")), "Energy", "monthly", nil, 12, nil, nil, nil, nil ],
  [Row.find_by(order: 3, page: Page.find_by(title:"Data Charts")), "Wind", "last 3 days", nil, 6, nil, nil, nil, nil ],
  [Row.find_by(order: 3, page: Page.find_by(title:"Data Charts")), "HSP", "daily", nil, 6, nil, nil, nil, nil ],
  [Row.find_by(order: 1, page: Page.find_by(title:"Tables")), "Tables", "filter results", nil, 12, nil, nil, nil, nil ],
]

panels_list.each do |row, title, subtitle, description, width, order, movable, minimizable, closable|
  Panel.create(row: row, title: title, subtitle: subtitle, description: description, width: width,
               order: order, movable: movable, minimizable: minimizable, closable: closable)
end

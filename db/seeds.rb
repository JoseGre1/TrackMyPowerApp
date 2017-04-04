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

dashboard_list = [
  'Default',
  'Blank'
]

dashboard_list.each do |description|
  Dashboard.create( description: description )
end

navbar_main_tab_list = [
  [ "Home", "fa fa-home", Dashboard.find_by(description: "Default"), false, router.root_path ],
  [ "Charts and Stats", "fa fa-bar-chart-o", Dashboard.find_by(description: "Default"), true, "javascript:;" ],
  [ "Export", "fa fa-download", Dashboard.find_by(description: "Default"), true, "javascript:;" ],
  [ "Alerts", "fa fa-bell", Dashboard.find_by(description: "Default"), false, "/notifications" ]
]

navbar_main_tab_list.each do |title, icon, dashboard, dropdown, link|
  NavbarMainTab.create( title: title, icon: icon, dashboard: dashboard, dropdown: dropdown, link: link )
end

navbar_sub_tab_list = [
  [ "Data Charts", NavbarMainTab.find_by(title: "Charts and Stats"), "/charts/data" ],
  [ "Tables", NavbarMainTab.find_by(title: "Export"), "/export/tables" ]
]

navbar_sub_tab_list.each do |title, navbar_main_tab, link|
  NavbarSubTab.create( title: title, navbar_main_tab: navbar_main_tab, link: link )
end

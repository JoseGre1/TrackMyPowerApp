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
  [ "Dashboard", "fa fa-tachometer", false, router.dashboard_path ],
  [ "Charts and Stats", "fa fa-bar-chart-o", true, "javascript:;" ],
  [ "Export", "fa fa-download", true, "javascript:;" ],
  [ "Alerts", "fa fa-bell", false, "/alerts" ]
]

navbar_main_tab_list.each do |title, icon, dropdown, link|
  NavbarMainTab.create( title: title, icon: icon, dropdown: dropdown, link: link )
  NavbarMainTab.find_by(title: title).dashboard << Dashboard.find_by(description: 'Default')
  NavbarMainTab.find_by(title: title).dashboard << Dashboard.find_by(description: 'Blank')
end

navbar_sub_tab_list = [
  [ "Data Charts", NavbarMainTab.find_by(title: "Charts and Stats"), "/charts/data" ],
  [ "Tables", NavbarMainTab.find_by(title: "Export"), "/export/tables" ]
]

navbar_sub_tab_list.each do |title, navbar_main_tab, link|
  NavbarSubTab.create( title: title, navbar_main_tab: navbar_main_tab, link: link )
end

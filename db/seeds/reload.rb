# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

classes = [Panel, Row, Tile, Page, NavbarSubTab, NavbarMainTab]
classes.each do |current_class|
  errors = current_class.destroy_all
  puts errors
  errors = ActiveRecord::Base.connection.reset_pk_sequence!(current_class.table_name)
  puts errors
end
errors = Rails.application.load_seed
puts errors

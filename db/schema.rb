# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171023204128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "variable"
    t.string   "comparator"
    t.float    "value1"
    t.float    "value2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "enabled"
    t.boolean  "email"
    t.index ["user_id"], name: "index_alerts_on_user_id", using: :btree
  end

  create_table "dashboards", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dashboards_navbar_main_tabs", id: false, force: :cascade do |t|
    t.integer "dashboard_id",       null: false
    t.integer "navbar_main_tab_id", null: false
  end

  create_table "electrical_measurements", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "voltage_med1"
    t.float    "current_med1"
    t.float    "energy_med1"
    t.float    "power_med1"
    t.float    "pf_med1"
    t.float    "voltage_batt1"
    t.float    "voltage_batt2"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "internal_conditions_measurements", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "temperature_int"
    t.float    "humidity_int"
  end

  create_table "meteorological_measurements", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "temperature"
    t.float    "humidity"
    t.float    "wind_speed"
    t.float    "uv_index"
    t.float    "solar_radiation"
    t.float    "wind_direction"
  end

  create_table "navbar_main_tabs", force: :cascade do |t|
    t.string   "title"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "dropdown"
    t.string   "link"
  end

  create_table "navbar_sub_tabs", force: :cascade do |t|
    t.string   "title"
    t.integer  "navbar_main_tab_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "link"
    t.index ["navbar_main_tab_id"], name: "index_navbar_sub_tabs_on_navbar_main_tab_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
    t.integer  "user_id"
    t.boolean  "seen"
    t.integer  "source_id"
    t.boolean  "email"
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "navbar_tab_type"
    t.integer  "navbar_tab_id"
    t.integer  "dashboard_id"
    t.index ["dashboard_id"], name: "index_pages_on_dashboard_id", using: :btree
    t.index ["navbar_tab_type", "navbar_tab_id"], name: "index_pages_on_navbar_tab_type_and_navbar_tab_id", using: :btree
  end

  create_table "panel_condition_measurements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "temp_ext"
    t.float    "temp_panel"
    t.float    "radiation"
  end

  create_table "panels", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "subtitle"
    t.boolean  "minimizable"
    t.boolean  "closable"
    t.boolean  "movable"
    t.string   "title"
    t.string   "description"
    t.integer  "order"
    t.integer  "width"
    t.integer  "row_id"
    t.index ["row_id"], name: "index_panels_on_row_id", using: :btree
  end

  create_table "rows", force: :cascade do |t|
    t.integer  "capacity"
    t.integer  "height"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
    t.index ["page_id"], name: "index_rows_on_page_id", using: :btree
  end

  create_table "streams", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiles", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "icon"
    t.integer  "order"
    t.string   "title"
    t.string   "description"
    t.integer  "page_id"
    t.index ["page_id"], name: "index_tiles_on_page_id", using: :btree
  end

  create_table "training_data_measurements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.string   "label"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "username"
    t.integer  "dashboard_id"
    t.index ["dashboard_id"], name: "index_users_on_dashboard_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "wind_turbine_frequencies_measurements", force: :cascade do |t|
    t.float   "mag"
    t.integer "freq"
  end

  create_table "wind_turbine_speed_measurements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rpm"
  end

  create_table "wind_turbine_vibration_measurements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "m_ejex"
    t.float    "m_ejey"
    t.float    "m_ejez"
  end

  add_foreign_key "alerts", "users"
  add_foreign_key "navbar_sub_tabs", "navbar_main_tabs"
  add_foreign_key "notifications", "users"
  add_foreign_key "pages", "dashboards"
  add_foreign_key "panels", "rows"
  add_foreign_key "rows", "pages"
  add_foreign_key "tiles", "pages"
  add_foreign_key "users", "dashboards"
end

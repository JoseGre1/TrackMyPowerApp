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

ActiveRecord::Schema.define(version: 20170406160642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "description"
    t.boolean  "minimizable"
    t.boolean  "closable"
    t.boolean  "movable"
    t.integer  "pos_x"
    t.integer  "pos_y"
    t.integer  "size_x"
    t.integer  "size_y"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "dashboard_id"
    t.index ["dashboard_id"], name: "index_blocks_on_dashboard_id", using: :btree
  end

  create_table "dashboards", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dashboards_navbar_main_tabs", id: false, force: :cascade do |t|
    t.integer "dashboard_id",       null: false
    t.integer "navbar_main_tab_id", null: false
    t.index ["dashboard_id"], name: "index_dashboards_navbar_main_tabs_on_dashboard_id", using: :btree
    t.index ["navbar_main_tab_id"], name: "index_dashboards_navbar_main_tabs_on_navbar_main_tab_id", using: :btree
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
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  add_foreign_key "blocks", "dashboards"
  add_foreign_key "navbar_sub_tabs", "navbar_main_tabs"
  add_foreign_key "users", "dashboards"
end

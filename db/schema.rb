# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130826085522) do

  create_table "ad_places", force: true do |t|
    t.decimal  "size_x"
    t.decimal  "size_y"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", force: true do |t|
    t.string   "url"
    t.decimal  "size_x"
    t.decimal  "size_y"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners_campaigns", force: true do |t|
    t.integer "Campaign_id"
    t.integer "Banner_id"
  end

  create_table "campaigns", force: true do |t|
    t.integer  "customer_id"
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "budget"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.integer  "manager_id"
    t.string   "name"
    t.string   "contact"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.decimal  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true

  create_table "prices", force: true do |t|
    t.decimal  "price_for_thousand"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "SiteGroup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_groups_campaigns", force: true do |t|
    t.integer "SiteGroup_id"
    t.integer "Campaign_id"
  end

  create_table "site_groups_sites", force: true do |t|
    t.integer "SiteGroup_id"
    t.integer "Site_id"
  end

  create_table "sites", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

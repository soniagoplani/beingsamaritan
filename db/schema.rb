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

ActiveRecord::Schema.define(version: 20170501162158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.text     "body",       null: false
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_portfolios", force: :cascade do |t|
    t.string   "event_name",          null: false
    t.string   "organization_name",   null: false
    t.date     "event_date",          null: false
    t.time     "event_start",         null: false
    t.time     "event_end",           null: false
    t.string   "event_loc",           null: false
    t.string   "coordinator_name",    null: false
    t.string   "description",         null: false
    t.string   "participants",        null: false
    t.string   "highlights",          null: false, array: true
    t.string   "avatar_file_name",    null: false
    t.string   "avatar_content_type", null: false
    t.integer  "avatar_file_size",    null: false
    t.datetime "avatar_updated_at",   null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "scheduled_at"
    t.integer  "duration"
    t.string   "location"
    t.string   "coordinator_name"
    t.string   "coordinator_email"
    t.string   "coordinator_phone"
    t.text     "moto"
    t.text     "who_can_participate"
    t.string   "event_cost"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "head_name",  null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "pin_code"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "event_id",   null: false
    t.string   "name",       null: false
    t.string   "phone",      null: false
    t.string   "email"
    t.text     "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problem_categories", force: :cascade do |t|
    t.string   "name_category", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "problem_posts", force: :cascade do |t|
    t.string   "title",         null: false
    t.string   "category_name", null: false
    t.integer  "category_id",   null: false
    t.text     "content",       null: false
    t.string   "name",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_no"
    t.integer  "roles_mask"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "profession"
    t.string   "why_you_joining"
    t.string   "how_much_time"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_no"
    t.string   "profession"
    t.text     "why_you_joining"
    t.string   "time_contribution"
    t.integer  "organization_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end

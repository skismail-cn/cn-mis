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

ActiveRecord::Schema.define(version: 20141209045806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "availabilities", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "designations", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "designations", ["department_id"], name: "index_designations_on_department_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "Name"
    t.string   "Email"
    t.date     "Joining_Date"
    t.date     "Confirmation_Date"
    t.string   "Hot_Skills"
    t.decimal  "Salary",                       precision: 10, scale: 2
    t.integer  "Reporting_To"
    t.integer  "Earned_Leave",       limit: 2
    t.integer  "Casual_Leave",       limit: 2
    t.integer  "Sick_Leave",         limit: 2
    t.string   "salt"
    t.string   "encrypted_password"
    t.integer  "designation_id"
    t.integer  "department_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["department_id"], name: "index_members_on_department_id", using: :btree
  add_index "members", ["designation_id"], name: "index_members_on_designation_id", using: :btree
  add_index "members", ["location_id"], name: "index_members_on_location_id", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

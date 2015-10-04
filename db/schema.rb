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

ActiveRecord::Schema.define(version: 20151004210446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
    t.integer  "teacher_id"
    t.integer  "family_id"
    t.integer  "grade"
    t.string   "emails"
  end

  add_index "students", ["family_id"], name: "index_students_on_family_id", using: :btree
  add_index "students", ["full_name"], name: "index_students_on_full_name", using: :btree
  add_index "students", ["last_name"], name: "index_students_on_last_name", using: :btree
  add_index "students", ["teacher_id"], name: "index_students_on_teacher_id", using: :btree

  create_table "teachers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["last_name", "first_name"], name: "index_teachers_on_last_name_and_first_name", using: :btree

  create_table "walkathon_lap_counts", force: true do |t|
    t.integer  "student_id"
    t.integer  "lap_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "walkathon_lap_counts", ["student_id"], name: "index_walkathon_lap_counts_on_student_id", unique: true, using: :btree

  create_table "walkathon_payments", force: true do |t|
    t.string   "description"
    t.decimal  "amount",              precision: 7, scale: 2
    t.integer  "walkathon_pledge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "walkathon_payments", ["walkathon_pledge_id"], name: "index_walkathon_payments_on_walkathon_pledge_id", using: :btree

  create_table "walkathon_pledges", force: true do |t|
    t.string   "sponsor_name"
    t.string   "sponsor_phone"
    t.decimal  "pledge_per_lap",   precision: 5, scale: 2
    t.decimal  "maximum_pledge",   precision: 7, scale: 2
    t.decimal  "fixed_pledge",     precision: 7, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.string   "pledge_type"
    t.string   "sponsor_email"
    t.integer  "lap_count"
    t.decimal  "committed_amount", precision: 7, scale: 2
    t.decimal  "paid_amount",      precision: 7, scale: 2
  end

  add_index "walkathon_pledges", ["student_id"], name: "index_walkathon_pledges_on_student_id", using: :btree

end

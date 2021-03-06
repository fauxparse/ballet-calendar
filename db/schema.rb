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

ActiveRecord::Schema.define(version: 2018_08_02_040800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "day_id"
    t.bigint "teacher_id"
    t.integer "position"
    t.index ["day_id", "teacher_id"], name: "index_assignments_on_day_id_and_teacher_id", unique: true
    t.index ["day_id"], name: "index_assignments_on_day_id"
    t.index ["teacher_id"], name: "index_assignments_on_teacher_id"
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.boolean "active", default: false
    t.index ["date"], name: "index_days_on_date", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.citext "email"
    t.string "uid"
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.index ["uid"], name: "index_teachers_on_uid"
  end

  add_foreign_key "assignments", "days", on_delete: :cascade
  add_foreign_key "assignments", "teachers", on_delete: :cascade
end

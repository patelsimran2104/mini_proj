# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_24_113819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "results", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "Studentinfo_id"
    t.string "subjects"
    t.string "gread"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Studentinfo_id"], name: "index_results_on_Studentinfo_id"
    t.index ["student_id"], name: "index_results_on_student_id"
  end

  create_table "studentinfos", force: :cascade do |t|
    t.integer "result_id"
    t.integer "student_id", null: false
    t.string "name"
    t.date "dob"
    t.integer "age"
    t.string "personalemail"
    t.string "parentemail"
    t.string "hobby"
    t.string "address"
    t.string "permanentaddress"
    t.string "phoneNo"
    t.string "gender"
    t.string "password"
    t.string "education"
    t.text "city"
    t.text "state"
    t.string "socialId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["result_id"], name: "index_studentinfos_on_result_id"
    t.index ["student_id"], name: "index_studentinfos_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "studentinfo_id"
    t.index ["email"], name: "index_students_on_email", unique: true
  end

  add_foreign_key "results", "students"
  add_foreign_key "studentinfos", "students"
end

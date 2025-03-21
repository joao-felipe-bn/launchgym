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

ActiveRecord::Schema[7.1].define(version: 2024_04_18_050356) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_session_students", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "class_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_session_id"], name: "index_class_session_students_on_class_session_id"
    t.index ["student_id"], name: "index_class_session_students_on_student_id"
  end

  create_table "class_sessions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "instructor_id", null: false
    t.bigint "training_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_class_sessions_on_instructor_id"
    t.index ["training_id"], name: "index_class_sessions_on_training_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.string "email"
    t.string "document"
    t.string "phone"
    t.text "specialities"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.string "email"
    t.string "document"
    t.string "phone"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
    t.boolean "single"
    t.integer "reps"
    t.integer "durantion_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "class_session_students", "class_sessions"
  add_foreign_key "class_session_students", "students"
  add_foreign_key "class_sessions", "instructors"
  add_foreign_key "class_sessions", "trainings"
  add_foreign_key "instructors", "users"
  add_foreign_key "students", "users"
end

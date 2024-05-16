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

ActiveRecord::Schema[7.0].define(version: 2024_05_15_132634) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "medicins", force: :cascade do |t|
    t.string "name", null: false
    t.string "leaflet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_medicins_on_name", unique: true
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "street"
    t.string "street_number"
    t.string "district"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "role_users", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_users_on_role_id"
    t.index ["user_id"], name: "index_role_users_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "permissions", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_roles_on_organization_id"
  end

  create_table "sheltered_medication_logs", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "sheltered_medication_id"
    t.bigint "medicin_id"
    t.bigint "sheltered_id"
    t.integer "quantity"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicin_id"], name: "index_sheltered_medication_logs_on_medicin_id"
    t.index ["organization_id"], name: "index_sheltered_medication_logs_on_organization_id"
    t.index ["sheltered_id"], name: "index_sheltered_medication_logs_on_sheltered_id"
    t.index ["sheltered_medication_id"], name: "index_sheltered_medication_logs_on_sheltered_medication_id"
  end

  create_table "sheltered_medications", force: :cascade do |t|
    t.bigint "medicin_id", null: false
    t.bigint "sheltered_id", null: false
    t.bigint "organization_id", null: false
    t.integer "quantity"
    t.string "unit"
    t.integer "frequency"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicin_id"], name: "index_sheltered_medications_on_medicin_id"
    t.index ["organization_id"], name: "index_sheltered_medications_on_organization_id"
    t.index ["sheltered_id"], name: "index_sheltered_medications_on_sheltered_id"
  end

  create_table "sheltereds", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", null: false
    t.string "document"
    t.integer "children_in_house"
    t.integer "adults_in_house"
    t.integer "animals_in_house"
    t.string "house_status"
    t.date "birthdate"
    t.string "street"
    t.integer "street_number"
    t.string "district"
    t.string "city"
    t.string "gender"
    t.text "special_needs"
    t.text "medications"
    t.boolean "government_assist"
    t.boolean "cadunico"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sheltered_id"
    t.text "disabilities"
    t.string "phone_number"
    t.date "departure_date"
    t.index ["organization_id"], name: "index_sheltereds_on_organization_id"
    t.index ["sheltered_id"], name: "index_sheltereds_on_sheltered_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", null: false
    t.string "document"
    t.string "phone_number"
    t.string "work_shifts", array: true
    t.string "street"
    t.string "street_number"
    t.string "district"
    t.string "city"
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "volunteer_work_schedules", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "work_schedule_id", null: false
    t.string "work_shift"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_volunteer_work_schedules_on_role_id"
    t.index ["user_id", "work_schedule_id", "role_id", "work_shift"], name: "index_volunteer_work_schedules_user_id_unique", unique: true
    t.index ["user_id"], name: "index_volunteer_work_schedules_on_user_id"
    t.index ["work_schedule_id"], name: "index_volunteer_work_schedules_on_work_schedule_id"
  end

  create_table "work_schedules", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.date "scheduled_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "scheduled_date"], name: "index_work_schedules_on_organization_id_and_scheduled_date", unique: true
    t.index ["organization_id"], name: "index_work_schedules_on_organization_id"
  end

  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "roles", "organizations"
  add_foreign_key "sheltered_medication_logs", "medicins"
  add_foreign_key "sheltered_medication_logs", "organizations"
  add_foreign_key "sheltered_medication_logs", "sheltered_medications"
  add_foreign_key "sheltered_medication_logs", "sheltereds"
  add_foreign_key "sheltered_medications", "medicins"
  add_foreign_key "sheltered_medications", "organizations"
  add_foreign_key "sheltered_medications", "sheltereds"
  add_foreign_key "sheltereds", "organizations"
  add_foreign_key "sheltereds", "sheltereds"
  add_foreign_key "volunteer_work_schedules", "roles"
  add_foreign_key "volunteer_work_schedules", "users"
  add_foreign_key "volunteer_work_schedules", "work_schedules"
  add_foreign_key "work_schedules", "organizations"
end

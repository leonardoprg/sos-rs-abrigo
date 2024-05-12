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

ActiveRecord::Schema[7.0].define(version: 2024_05_12_021326) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "street"
    t.string "street_number"
    t.string "district"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "permissions", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_roles_on_organization_id"
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
    t.index ["organization_id"], name: "index_sheltereds_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "role_id", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "roles", "organizations"
  add_foreign_key "sheltereds", "organizations"
end

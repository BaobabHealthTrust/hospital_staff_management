# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_02_091612) do

  create_table "allocations", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.date "allocation_date"
    t.integer "assigned_by"
    t.boolean "voided"
    t.string "voided_reason"
    t.date "voided_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "priority"
    t.integer "assigned_to"
    t.integer "patient_id"
    t.integer "status", default: 0
  end

  create_table "encounters", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "encounter_type"
    t.integer "weight"
    t.integer "height"
    t.integer "temperature"
    t.integer "BP"
    t.boolean "voided"
    t.string "voided_reason"
    t.date "voided_date"
    t.bigint "patient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "allocation_id"
    t.index ["patient_id"], name: "index_encounters_on_patient_id"
  end

  create_table "patients", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "family_name"
    t.date "date_of_birth"
    t.text "email"
    t.text "address"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "voided"
    t.string "voided_reason"
    t.date "voided_date"
    t.string "gender"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role_name"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.date "date_of_birth", null: false
    t.text "email", null: false
    t.boolean "voided"
    t.string "voided_reason"
    t.date "voided_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id"
    t.string "status"
    t.bigint "user_id_id"
    t.string "first_name"
    t.string "last_name"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "encounters", "patients"
  add_foreign_key "users", "roles"
end

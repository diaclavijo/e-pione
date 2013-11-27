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

ActiveRecord::Schema.define(version: 20131106164249) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "consultations", force: true do |t|
    t.integer  "patient_id"
    t.integer  "physician_id"
    t.integer  "activity"
    t.date     "date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consultations", ["patient_id"], name: "index_consultations_on_patient_id", using: :btree
  add_index "consultations", ["physician_id"], name: "index_consultations_on_physician_id", using: :btree

  create_table "patients", force: true do |t|
    t.string   "surname"
    t.string   "name"
    t.date     "birth"
    t.integer  "gender"
    t.integer  "civil_status"
    t.string   "NIF"
    t.string   "passport"
    t.string   "public_insurance_number"
    t.string   "private_insurance_number"
    t.boolean  "exitus"
    t.integer  "phone_house"
    t.integer  "mobile_phone"
    t.integer  "other_phone"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "education"
    t.integer  "occupation"
    t.integer  "employment"
    t.integer  "economic_situation"
    t.integer  "institutionalized"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["NIF"], name: "index_patients_on_NIF", unique: true, using: :btree
  add_index "patients", ["name"], name: "index_patients_on_name", using: :btree
  add_index "patients", ["passport"], name: "index_patients_on_passport", unique: true, using: :btree
  add_index "patients", ["surname"], name: "index_patients_on_surname", using: :btree

  create_table "physicians", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                                null: false
    t.string   "surname",                             null: false
  end

  add_index "physicians", ["email"], name: "index_physicians_on_email", unique: true, using: :btree
  add_index "physicians", ["reset_password_token"], name: "index_physicians_on_reset_password_token", unique: true, using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

end

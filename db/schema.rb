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

ActiveRecord::Schema.define(version: 20131125174139) do

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

  create_table "cognitive_symptomatologies", force: true do |t|
    t.integer  "memory"
    t.integer  "disorientation"
    t.integer  "aphasia"
    t.integer  "apraxia"
    t.integer  "agnosia"
    t.integer  "executive"
    t.integer  "reasoning"
    t.integer  "spatial"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cognitive_symptomatologies", ["consultation_id"], name: "index_cognitive_symptomatologies_on_consultation_id", using: :btree

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

  create_table "examinations", force: true do |t|
    t.integer  "examination_data_id"
    t.string   "examination_data_type"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "examinations", ["consultation_id"], name: "index_examinations_on_consultation_id", using: :btree

  create_table "neurological_examinations", force: true do |t|
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "f5"
    t.integer  "f6"
    t.integer  "f7"
    t.integer  "f8"
    t.integer  "f9"
    t.integer  "f10"
    t.integer  "f11"
    t.integer  "f12"
    t.integer  "f13"
    t.integer  "f14"
    t.integer  "f15"
    t.integer  "f16"
    t.integer  "f17"
    t.integer  "f18"
    t.integer  "f19"
    t.integer  "f20"
    t.integer  "f21"
    t.integer  "f22"
    t.integer  "f23"
    t.integer  "f24"
    t.integer  "f25"
    t.integer  "f26"
    t.integer  "f27"
    t.integer  "f28"
    t.integer  "f29"
    t.integer  "f30"
    t.integer  "f31"
    t.integer  "f32"
    t.integer  "f33"
    t.integer  "f34"
    t.integer  "f35"
    t.integer  "f36"
    t.integer  "f37"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "neurological_examinations", ["consultation_id"], name: "index_neurological_examinations_on_consultation_id", using: :btree

  create_table "no_cognitive_symptomatologies", force: true do |t|
    t.integer  "psychomotor"
    t.integer  "lability"
    t.integer  "euphoria"
    t.integer  "apathy"
    t.integer  "depression"
    t.integer  "anxiety"
    t.integer  "hallucinations"
    t.integer  "delusions"
    t.integer  "disinhibition"
    t.integer  "motor"
    t.integer  "sleep"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "no_cognitive_symptomatologies", ["consultation_id"], name: "index_no_cognitive_symptomatologies_on_consultation_id", using: :btree

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

  create_table "physical_examinations", force: true do |t|
    t.float    "talla"
    t.float    "peso"
    t.string   "tension"
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "f5"
    t.integer  "f6"
    t.integer  "f7"
    t.integer  "f8"
    t.integer  "f9"
    t.integer  "f10"
    t.integer  "f11"
    t.integer  "f12"
    t.integer  "f13"
    t.integer  "f14"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "physical_examinations", ["consultation_id"], name: "index_physical_examinations_on_consultation_id", using: :btree

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

  create_table "test_barthels", force: true do |t|
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "f5"
    t.integer  "f6"
    t.integer  "f7"
    t.integer  "f8"
    t.integer  "f9"
    t.integer  "f10"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_barthels", ["consultation_id"], name: "index_test_barthels_on_consultation_id", using: :btree

  create_table "test_iqcodes", force: true do |t|
    t.integer  "first"
    t.integer  "second"
    t.integer  "third"
    t.integer  "forth"
    t.integer  "fifth"
    t.integer  "sixth"
    t.integer  "seventh"
    t.integer  "eighth"
    t.integer  "ninth"
    t.integer  "tenth"
    t.integer  "eleventh"
    t.integer  "twelfth"
    t.integer  "thirteenth"
    t.integer  "fourteenth"
    t.integer  "fifteenth"
    t.integer  "sixteenth"
    t.integer  "seventeenth"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_iqcodes", ["consultation_id"], name: "index_test_iqcodes_on_consultation_id", using: :btree

  create_table "test_mecs", force: true do |t|
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "f5"
    t.integer  "f6"
    t.integer  "f7"
    t.integer  "f8"
    t.integer  "f9"
    t.integer  "f10"
    t.integer  "f11"
    t.integer  "f12"
    t.integer  "f13"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_mecs", ["consultation_id"], name: "index_test_mecs_on_consultation_id", using: :btree

  create_table "test_minimentals", force: true do |t|
    t.integer  "year"
    t.integer  "station"
    t.integer  "day_month"
    t.integer  "day_week"
    t.integer  "month"
    t.integer  "country"
    t.integer  "province"
    t.integer  "city"
    t.integer  "where"
    t.integer  "flat"
    t.integer  "objects"
    t.integer  "attention"
    t.integer  "memory"
    t.integer  "pencil"
    t.integer  "repeat"
    t.integer  "orders"
    t.integer  "eyes"
    t.integer  "sentence"
    t.integer  "draw"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_minimentals", ["consultation_id"], name: "index_test_minimentals_on_consultation_id", using: :btree

  create_table "test_npis", force: true do |t|
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "f5"
    t.integer  "f6"
    t.integer  "f7"
    t.integer  "f8"
    t.integer  "f9"
    t.integer  "f10"
    t.integer  "f11"
    t.integer  "f12"
    t.integer  "f13"
    t.integer  "f14"
    t.integer  "f15"
    t.integer  "f16"
    t.integer  "f17"
    t.integer  "f18"
    t.integer  "f19"
    t.integer  "f20"
    t.integer  "f21"
    t.integer  "f22"
    t.integer  "f23"
    t.integer  "f24"
    t.integer  "f25"
    t.integer  "f26"
    t.integer  "f27"
    t.integer  "f28"
    t.integer  "f29"
    t.integer  "f30"
    t.integer  "f31"
    t.integer  "f32"
    t.integer  "f33"
    t.integer  "f34"
    t.integer  "f35"
    t.integer  "f36"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_npis", ["consultation_id"], name: "index_test_npis_on_consultation_id", using: :btree

  create_table "test_pfeiffers", force: true do |t|
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "f5"
    t.integer  "f6"
    t.integer  "f7"
    t.integer  "f8"
    t.integer  "f9"
    t.integer  "f10"
    t.integer  "f11"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_pfeiffers", ["consultation_id"], name: "index_test_pfeiffers_on_consultation_id", using: :btree

  create_table "test_relojs", force: true do |t|
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_relojs", ["consultation_id"], name: "index_test_relojs_on_consultation_id", using: :btree

  create_table "test_yesavage10s", force: true do |t|
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "f5"
    t.integer  "f6"
    t.integer  "f7"
    t.integer  "f8"
    t.integer  "f9"
    t.integer  "f10"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_yesavage10s", ["consultation_id"], name: "index_test_yesavage10s_on_consultation_id", using: :btree

  create_table "test_yesavage15s", force: true do |t|
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "f5"
    t.integer  "f6"
    t.integer  "f7"
    t.integer  "f8"
    t.integer  "f9"
    t.integer  "f10"
    t.integer  "f11"
    t.integer  "f12"
    t.integer  "f13"
    t.integer  "f14"
    t.integer  "f15"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_yesavage15s", ["consultation_id"], name: "index_test_yesavage15s_on_consultation_id", using: :btree

  create_table "test_yesavage30s", force: true do |t|
    t.integer  "f1"
    t.integer  "f2"
    t.integer  "f3"
    t.integer  "f4"
    t.integer  "f5"
    t.integer  "f6"
    t.integer  "f7"
    t.integer  "f8"
    t.integer  "f9"
    t.integer  "f10"
    t.integer  "f11"
    t.integer  "f12"
    t.integer  "f13"
    t.integer  "f14"
    t.integer  "f15"
    t.integer  "f16"
    t.integer  "f17"
    t.integer  "f18"
    t.integer  "f19"
    t.integer  "f20"
    t.integer  "f21"
    t.integer  "f22"
    t.integer  "f23"
    t.integer  "f24"
    t.integer  "f25"
    t.integer  "f26"
    t.integer  "f27"
    t.integer  "f28"
    t.integer  "f29"
    t.integer  "f30"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_yesavage30s", ["consultation_id"], name: "index_test_yesavage30s_on_consultation_id", using: :btree

  create_table "test_yesavage4s", force: true do |t|
    t.integer  "first"
    t.integer  "second"
    t.integer  "third"
    t.integer  "forth"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_yesavage4s", ["consultation_id"], name: "index_test_yesavage4s_on_consultation_id", using: :btree

  create_table "tests", force: true do |t|
    t.integer  "category"
    t.string   "score"
    t.integer  "test_data_id"
    t.string   "test_data_type"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tests", ["consultation_id"], name: "index_tests_on_consultation_id", using: :btree

end

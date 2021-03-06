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

ActiveRecord::Schema.define(version: 20160921024401) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "address_id"
    t.string   "email"
    t.integer  "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_contact_infos_on_address_id"
    t.index ["entity_id"], name: "index_contact_infos_on_entity_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string   "name"
    t.integer  "contact_info_id"
    t.integer  "address_id"
    t.string   "uuid"
    t.string   "stripe_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["address_id"], name: "index_entities_on_address_id"
    t.index ["contact_info_id"], name: "index_entities_on_contact_info_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "uuid"
    t.string   "stripe_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "mapping_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mappings", force: :cascade do |t|
    t.string   "name"
    t.integer  "mapping_type_id"
    t.text     "description"
    t.integer  "group_id"
    t.text     "received_text"
    t.text     "reply_text"
    t.text     "external_function"
    t.text     "hours_url"
    t.text     "location"
    t.text     "call_back_info"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["group_id"], name: "index_mappings_on_group_id"
    t.index ["mapping_type_id"], name: "index_mappings_on_mapping_type_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "group_id"
    t.text     "description"
    t.text     "our_metadata"
    t.text     "their_metadata"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["group_id"], name: "index_phone_numbers_on_group_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

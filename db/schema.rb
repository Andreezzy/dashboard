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

ActiveRecord::Schema.define(version: 20170305052128) do

  create_table "expense_types", force: :cascade do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_expense_types_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "name"
    t.integer  "expense_type_id"
    t.integer  "price_id"
    t.integer  "user_id"
    t.integer  "pay_type",        default: 0
    t.date     "date_create"
    t.time     "hour_create"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["expense_type_id"], name: "index_expenses_on_expense_type_id"
    t.index ["price_id"], name: "index_expenses_on_price_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "money",       default: 0
    t.integer  "total",       default: 0
    t.integer  "dolar_price", default: 10000
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "occupation"
    t.string   "uid"
    t.string   "provider"
    t.string   "image"
    t.string   "role",                   default: "regular"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

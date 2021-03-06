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

ActiveRecord::Schema.define(version: 20160119233812) do

  create_table "questions", force: :cascade do |t|
    t.text     "body"
    t.text     "choice1"
    t.text     "choice2"
    t.text     "choice3"
    t.text     "choice4"
    t.string   "category"
    t.string   "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.boolean  "flow",       default: false
    t.boolean  "knowledge",  default: false
    t.text     "result"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "points"
  end

  add_index "quizzes", ["user_id"], name: "index_quizzes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.boolean  "driving",           default: false
    t.boolean  "license",           default: false
    t.boolean  "gameteam",          default: false
    t.integer  "score",             default: 0
    t.integer  "age",               default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

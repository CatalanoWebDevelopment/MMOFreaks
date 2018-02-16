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

ActiveRecord::Schema.define(version: 20180215184508) do

  create_table "build_equipments", force: :cascade do |t|
    t.integer "build_id"
    t.integer "equipment_id"
  end

  create_table "builds", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "klass_id"
    t.integer "race_id"
    t.string "description"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "build_id"
  end

  create_table "equipments", force: :cascade do |t|
    t.string "stats"
    t.string "name"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "name"
    t.string "skills"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.string "attributes"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
  end

end

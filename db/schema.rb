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

ActiveRecord::Schema.define(version: 20171009174943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "investments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "nfl_athlete_id"
    t.integer "quantity"
    t.float "acquisition_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nfl_athletes", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "team"
    t.integer "passing_yards", default: 0
    t.integer "passing_touchdowns", default: 0
    t.integer "rushing_yards", default: 0
    t.integer "rushing_touchdowns", default: 0
    t.integer "receiving_yards", default: 0
    t.integer "receiving_touchdowns", default: 0
    t.float "initial_stock_value", default: 0.0
    t.float "current_stock_value", default: 0.0
    t.float "fantasy_projection", default: 0.0
    t.float "actual_fantasy_value", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.float "budget", default: 10000.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

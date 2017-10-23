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

ActiveRecord::Schema.define(version: 20171023222246) do

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
    t.float "week_one", default: 0.0
    t.float "week_two", default: 0.0
    t.float "week_three", default: 0.0
    t.float "week_four", default: 0.0
    t.float "week_five", default: 0.0
    t.float "week_six", default: 0.0
    t.float "week_seven", default: 0.0
    t.float "week_eight", default: 0.0
    t.float "week_nine", default: 0.0
    t.float "week_ten", default: 0.0
    t.float "week_eleven", default: 0.0
    t.float "week_twelve", default: 0.0
    t.float "week_thirteen", default: 0.0
    t.float "week_fourteen", default: 0.0
    t.float "week_fifteen", default: 0.0
    t.float "week_sixteen", default: 0.0
    t.float "week_seventeen", default: 0.0
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.float "budget", default: 10000.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

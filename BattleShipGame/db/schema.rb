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

ActiveRecord::Schema.define(version: 20160828072707) do

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grids", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
  end

  add_index "grids", ["player_id"], name: "index_grids_on_player_id"

  create_table "players", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "name"
    t.string   "hits"
    t.string   "misses"
    t.string   "ship_placed_points"
    t.integer  "game_id"
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id"

  create_table "ships", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "grid_id"
    t.string   "type"
    t.integer  "size"
    t.string   "placed_points"
  end

  add_index "ships", ["grid_id"], name: "index_ships_on_grid_id"

end

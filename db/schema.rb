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

ActiveRecord::Schema.define(version: 2022_07_05_044539) do

  create_table "action_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "battle_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "character_id"
    t.bigint "rank_id"
    t.bigint "stage_id"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_battle_records_on_character_id"
    t.index ["rank_id"], name: "index_battle_records_on_rank_id"
    t.index ["stage_id"], name: "index_battle_records_on_stage_id"
    t.index ["user_id"], name: "index_battle_records_on_user_id"
  end

  create_table "character_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.bigint "character_category_id"
    t.bigint "action_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_type_id"], name: "index_characters_on_action_type_id"
    t.index ["character_category_id"], name: "index_characters_on_character_category_id"
  end

  create_table "ranks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "battle_records", "characters"
  add_foreign_key "battle_records", "ranks"
  add_foreign_key "battle_records", "stages"
  add_foreign_key "battle_records", "users"
  add_foreign_key "characters", "action_types"
  add_foreign_key "characters", "character_categories"
end

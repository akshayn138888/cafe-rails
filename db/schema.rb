# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_26_195918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoris", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "categori_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categori_id"], name: "index_courses_on_categori_id"
  end

  create_table "daily_menus", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "features", force: :cascade do |t|
    t.bigint "daily_menu_id", null: false
    t.bigint "course_id", null: false
    t.float "price"
    t.boolean "portion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_features_on_course_id"
    t.index ["daily_menu_id"], name: "index_features_on_daily_menu_id"
  end

  add_foreign_key "courses", "categoris"
  add_foreign_key "features", "courses"
  add_foreign_key "features", "daily_menus"
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_25_084717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "role"
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "point_categories", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "point_category_id", null: false
    t.boolean "is_approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_points_on_member_id"
    t.index ["point_category_id"], name: "index_points_on_point_category_id"
  end

  add_foreign_key "points", "members"
  add_foreign_key "points", "point_categories"
end

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

ActiveRecord::Schema[7.0].define(version: 2023_06_09_101237) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "deadline"
    t.bigint "technologies_ids", default: [], array: true
    t.bigint "workers_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "tech_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technologies_workers", id: false, force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "technology_id", null: false
    t.index ["technology_id", "worker_id"], name: "index_technologies_workers_on_technology_id_and_worker_id"
    t.index ["worker_id", "technology_id"], name: "index_technologies_workers_on_worker_id_and_technology_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "surname"
    t.string "age"
    t.string "password_digest"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "technologies_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technologies_id"], name: "index_workers_on_technologies_id"
    t.index ["user_id"], name: "index_workers_on_user_id"
  end

  add_foreign_key "workers", "technologies", column: "technologies_id"
  add_foreign_key "workers", "users"
end

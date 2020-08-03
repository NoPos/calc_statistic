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

ActiveRecord::Schema.define(version: 2020_08_02_093807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", primary_key: "client_id", force: :cascade do |t|
    t.string "client_first_name"
    t.string "client_last_name"
    t.datetime "updated_at"
  end

  create_table "data_storage", force: :cascade do |t|
    t.string "data_type"
    t.text "data_string"
    t.datetime "created_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "highest_revenue_all_time", force: :cascade do |t|
    t.string "full_name"
    t.integer "revenue"
    t.datetime "updated_at"
  end

  create_table "lowest_revenue_all_time", force: :cascade do |t|
    t.string "full_name"
    t.integer "revenue"
    t.datetime "updated_at"
  end

  create_table "lowest_revenue_last_event", force: :cascade do |t|
    t.string "full_name"
    t.integer "revenue"
    t.datetime "updated_at"
  end

  create_table "revenues", force: :cascade do |t|
    t.bigint "client_id"
    t.integer "revenue"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_revenues_on_client_id", unique: true
  end

  create_table "top_highest_revenue", force: :cascade do |t|
    t.string "full_name"
    t.integer "revenue"
  end

  create_table "total_revenue_last_event", force: :cascade do |t|
    t.integer "revenue"
    t.datetime "updated_at"
  end

end

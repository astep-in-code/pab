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

ActiveRecord::Schema.define(version: 2020_02_08_102453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "beer_steps", force: :cascade do |t|
    t.integer "step"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "beer_sub_steps", force: :cascade do |t|
    t.string "sub_step"
    t.bigint "beer_step_id", null: false
    t.bigint "beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_beer_sub_steps_on_beer_id"
    t.index ["beer_step_id"], name: "index_beer_sub_steps_on_beer_step_id"
  end

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "style"
    t.integer "volume"
    t.string "fermentation"
    t.integer "initial_density_target"
    t.integer "final_density_target"
    t.integer "fermentation_temperature_target"
    t.integer "color"
    t.integer "bitterness"
    t.integer "bitterness_ratio"
    t.string "alcohol"
    t.text "description"
    t.text "recipe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo"
  end

  create_table "brew_steps", force: :cascade do |t|
    t.integer "status"
    t.bigint "brew_id", null: false
    t.bigint "beer_step_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_step_id"], name: "index_brew_steps_on_beer_step_id"
    t.index ["brew_id"], name: "index_brew_steps_on_brew_id"
  end

  create_table "brews", force: :cascade do |t|
    t.bigint "beer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_brews_on_beer_id"
    t.index ["user_id"], name: "index_brews_on_user_id"
  end

  create_table "ispindles", force: :cascade do |t|
    t.string "temperature"
    t.string "density"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.bigint "brew_id"
    t.index ["brew_id"], name: "index_ispindles_on_brew_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.datetime "date_of_birth"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "beer_sub_steps", "beer_steps"
  add_foreign_key "beer_sub_steps", "beers"
  add_foreign_key "brew_steps", "beer_steps"
  add_foreign_key "brew_steps", "brews"
  add_foreign_key "brews", "beers"
  add_foreign_key "brews", "users"
  add_foreign_key "ispindles", "brews"
end

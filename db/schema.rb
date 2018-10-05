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

ActiveRecord::Schema.define(version: 2018_10_04_071955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.string "logo_url"
    t.json "media_links"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities_events", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "community_id"
    t.index ["community_id"], name: "index_communities_events_on_community_id"
    t.index ["event_id"], name: "index_communities_events_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string "cover_img_url"
    t.string "slug_url", null: false
    t.string "meetup_url"
    t.string "event_type"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "identities", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider"], name: "index_identities_on_provider", unique: true
    t.index ["uid"], name: "index_identities_on_uid", unique: true
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.datetime "starts_at"
    t.bigint "event_id"
    t.bigint "user_id"
    t.string "session_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_sessions_on_event_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "avatar_url"
    t.string "public_id"
    t.integer "roles_mask"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "maps_url"
    t.string "website_url"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "communities_events", "communities"
  add_foreign_key "communities_events", "events"
  add_foreign_key "events", "venues"
  add_foreign_key "identities", "users"
  add_foreign_key "sessions", "events"
  add_foreign_key "sessions", "users"
end

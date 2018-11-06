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

ActiveRecord::Schema.define(version: 2018_11_02_084214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "registered_at"
    t.datetime "confirmed_at"
    t.string "reasons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendees_on_event_id"
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

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

  create_table "speakers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "registered_at"
    t.string "reasons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_speakers_on_event_id"
    t.index ["user_id"], name: "index_speakers_on_user_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.string "submission_type"
    t.json "reasons"
    t.bigint "user_id"
    t.datetime "submitted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "user_sessions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "session_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_user_sessions_on_session_id"
    t.index ["user_id"], name: "index_user_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar_url"
    t.string "public_id"
    t.string "phone"
    t.string "institution"
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

  add_foreign_key "attendees", "events"
  add_foreign_key "attendees", "users"
  add_foreign_key "communities_events", "communities"
  add_foreign_key "communities_events", "events"
  add_foreign_key "events", "venues"
  add_foreign_key "identities", "users"
  add_foreign_key "sessions", "events"
  add_foreign_key "sessions", "users"
  add_foreign_key "speakers", "events"
  add_foreign_key "speakers", "users"
  add_foreign_key "submissions", "users"
  add_foreign_key "user_sessions", "sessions"
  add_foreign_key "user_sessions", "users"
end

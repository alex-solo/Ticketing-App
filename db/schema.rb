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

ActiveRecord::Schema.define(version: 20171205044846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.bigint "ticket_id", null: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_comments_on_creator_id"
    t.index ["ticket_id"], name: "index_comments_on_ticket_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "ticket_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["ticket_id"], name: "index_taggings_on_ticket_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name", null: false
    t.string "body"
    t.string "status", default: "new", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", null: false
    t.bigint "assignee_id"
    t.index ["assignee_id"], name: "index_tickets_on_assignee_id"
    t.index ["creator_id"], name: "index_tickets_on_creator_id"
    t.index ["project_id"], name: "index_tickets_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "tickets"
  add_foreign_key "comments", "users", column: "creator_id"
  add_foreign_key "taggings", "tags"
  add_foreign_key "taggings", "tickets"
  add_foreign_key "tickets", "projects"
  add_foreign_key "tickets", "users", column: "assignee_id"
  add_foreign_key "tickets", "users", column: "creator_id"
end
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

ActiveRecord::Schema.define(version: 20170226140527) do

  create_table "associations", force: :cascade do |t|
    t.integer  "partner_id", null: false
    t.integer  "club_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_associations_on_club_id"
    t.index ["partner_id"], name: "index_associations_on_partner_id"
  end

  create_table "availables", force: :cascade do |t|
    t.integer  "edition_id"
    t.integer  "item_id"
    t.integer  "amount",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["edition_id"], name: "index_availables_on_edition_id"
    t.index ["item_id"], name: "index_availables_on_item_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.date     "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "name",                     null: false
    t.string   "description"
    t.integer  "price_cents"
    t.string   "barcode"
    t.string   "barcode_data"
    t.string   "barcode_img_file_name"
    t.string   "barcode_img_content_type"
    t.integer  "barcode_img_file_size"
    t.datetime "barcode_img_updated_at"
    t.string   "type"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["name"], name: "index_items_on_name"
    t.index ["parent_id"], name: "index_items_on_parent_id"
    t.index [nil], name: "index_items_on_category"
  end

  create_table "partners", force: :cascade do |t|
    t.integer  "edition_id"
    t.string   "name",                 null: false
    t.string   "authentication_token", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["edition_id"], name: "index_partners_on_edition_id"
  end

end

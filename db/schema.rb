# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 1) do

  create_table "approval_docs", force: true do |t|
    t.integer  "line_item_id",              null: false
    t.binary   "is_required",   limit: 1,   null: false
    t.integer  "status_code",               null: false
    t.string   "assigned_to",   limit: 45
    t.datetime "required_by"
    t.integer  "priority_code",             null: false
    t.integer  "doc_type_code"
    t.string   "desc",          limit: 140
  end

  add_index "approval_docs", ["assigned_to"], name: "app_doc_assigned_to_idx", using: :btree
  add_index "approval_docs", ["doc_type_code"], name: "app_doc_type_cd_idx", using: :btree
  add_index "approval_docs", ["line_item_id"], name: "app_doc_item_id_idx", using: :btree
  add_index "approval_docs", ["priority_code"], name: "app_doc_priotity_cd_idx", using: :btree
  add_index "approval_docs", ["status_code"], name: "app_doc_status_cd_idx", using: :btree

  create_table "approval_hist", force: true do |t|
    t.integer  "object_id",                null: false
    t.integer  "approval_code",            null: false
    t.datetime "update_date",              null: false
    t.string   "updated_by",    limit: 45, null: false
  end

  add_index "approval_hist", ["updated_by"], name: "update_by_user_idx", using: :btree

  create_table "codes", primary_key: "code_id", force: true do |t|
    t.string "code_desc",    limit: 140
    t.string "decode_value", limit: 45
  end

  create_table "company_list", primary_key: "company_id", force: true do |t|
    t.string "comapny_name", limit: 45
  end

  add_index "company_list", ["comapny_name"], name: "comapny_name_UNIQUE", unique: true, using: :btree

  create_table "master_po", primary_key: "po_id", force: true do |t|
    t.string  "po_num",       limit: 45, null: false
    t.date    "created_date",            null: false
    t.integer "project_id"
    t.binary  "is_active",    limit: 1
    t.integer "company_id"
  end

  add_index "master_po", ["company_id"], name: "company_po_idx", using: :btree
  add_index "master_po", ["project_id"], name: "po_project_fk_idx", using: :btree

  create_table "po_line_items", primary_key: "item_id", force: true do |t|
    t.integer  "po_id",                                                              null: false
    t.string   "line_item_num",    limit: 45,                                        null: false
    t.string   "line_item_desc",   limit: 45
    t.binary   "docs_required",    limit: 1,                           default: "0", null: false
    t.decimal  "price",                       precision: 10, scale: 2
    t.integer  "status_code",                                                        null: false
    t.datetime "approved_by_date"
    t.integer  "doc_list_id"
  end

  add_index "po_line_items", ["line_item_num"], name: "line_item_num_UNIQUE", unique: true, using: :btree
  add_index "po_line_items", ["po_id"], name: "po_master_item_link_idx", using: :btree
  add_index "po_line_items", ["status_code"], name: "po_item_codes_idx", using: :btree

  create_table "project_list", primary_key: "project_id", force: true do |t|
    t.string "project_name", limit: 45
    t.binary "is_active",    limit: 1,  default: "0", null: false
  end

  add_index "project_list", ["project_name"], name: "project_name_UNIQUE", unique: true, using: :btree

  create_table "project_po_list", force: true do |t|
    t.integer  "project_id",                 null: false
    t.integer  "po_id",                      null: false
    t.string   "project_name",    limit: 45, null: false
    t.string   "po_num",          limit: 45, null: false
    t.binary   "is_approved",     limit: 1
    t.datetime "approve_by_date"
    t.datetime "approval_date"
    t.string   "approved_by",     limit: 45
  end

  add_index "project_po_list", ["po_id"], name: "proj_po_link1_idx", using: :btree
  add_index "project_po_list", ["project_id"], name: "proj_link_idx", using: :btree

<<<<<<< HEAD
  create_table "user_company", id: false, force: true do |t|
=======
  create_table "projects", force: :cascade do |t|
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "position",    limit: 4,   null: false
    t.string  "description", limit: 200
    t.string  "created_by",  limit: 255, null: false
    t.integer "company_id",  limit: 4,   null: false
    t.integer "project_id",  limit: 4,   null: false
  end

  add_index "tasks", ["company_id"], name: "company_po_idx", using: :btree
  add_index "tasks", ["project_id"], name: "project_id_idx", using: :btree

  create_table "test_1", id: false, force: :cascade do |t|
    t.integer "TEST", limit: 4
  end

  create_table "user_company", id: false, force: :cascade do |t|
>>>>>>> 11b656801fe827cd9d215001a3eb473f537c51da
    t.string   "user_name",    limit: 45, null: false
    t.integer  "company_id",              null: false
    t.binary   "is_active",    limit: 1,  null: false
    t.datetime "created_date",            null: false
  end

  add_index "user_company", ["company_id"], name: "user_id_company_id_idx", using: :btree
  add_index "user_company", ["user_name"], name: "user_name_UNIQUE", unique: true, using: :btree

  create_table "user_company_roles", force: true do |t|
    t.string  "user_name",  limit: 45, null: false
    t.integer "company_id",            null: false
    t.integer "role_code",             null: false
    t.binary  "is_active",  limit: 1
  end

  add_index "user_company_roles", ["company_id"], name: "comp_role_comp_idx", using: :btree
  add_index "user_company_roles", ["role_code"], name: "comp_role_role_idx", using: :btree
  add_index "user_company_roles", ["user_name", "company_id", "role_code"], name: "company_role_unique", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "user_name",    limit: 45, null: false
    t.string   "common_name",  limit: 60
    t.datetime "created_date"
    t.binary   "is_active",    limit: 1,  null: false
  end

<<<<<<< HEAD
  add_index "users", ["user_name"], name: "user_name_UNIQUE", unique: true, using: :btree
=======
  add_index "users", ["company_id"], name: "company_po_idx", using: :btree
  add_index "users", ["role_code"], name: "role_code_idx", using: :btree
>>>>>>> 11b656801fe827cd9d215001a3eb473f537c51da

end

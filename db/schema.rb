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

ActiveRecord::Schema.define(version: 20160131223510) do

  create_table "approval_comments", force: :cascade do |t|
    t.integer  "approval_doc_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.text     "body",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "approval_comments", ["approval_doc_id"], name: "index_approval_comments_on_approval_doc_id", using: :btree
  add_index "approval_comments", ["user_id"], name: "index_approval_comments_on_user_id", using: :btree

  create_table "approval_docs", force: :cascade do |t|
    t.integer  "item_id",     limit: 4
    t.binary   "is_required", limit: 1
    t.integer  "status",      limit: 4
    t.string   "assigned_to", limit: 45
    t.datetime "required_by"
    t.integer  "priority",    limit: 4
    t.integer  "doc_type",    limit: 4
    t.string   "desc",        limit: 140
    t.string   "name",        limit: 255
  end

  add_index "approval_docs", ["assigned_to"], name: "app_doc_assigned_to_idx", using: :btree
  add_index "approval_docs", ["doc_type"], name: "app_doc_type_cd_idx", using: :btree
  add_index "approval_docs", ["item_id"], name: "app_doc_item_id_idx", using: :btree
  add_index "approval_docs", ["priority"], name: "app_doc_priotity_cd_idx", using: :btree
  add_index "approval_docs", ["status"], name: "app_doc_status_cd_idx", using: :btree

  create_table "approval_hists", force: :cascade do |t|
    t.integer  "approval_doc_id", limit: 4
    t.integer  "approval_code",   limit: 4
    t.datetime "update_date"
    t.string   "updated_by",      limit: 45
  end

  add_index "approval_hists", ["updated_by"], name: "update_by_user_idx", using: :btree

  create_table "codes", primary_key: "code_id", force: :cascade do |t|
    t.string "code_desc",    limit: 140
    t.string "decode_value", limit: 45
  end

  create_table "company", force: :cascade do |t|
    t.string "name", limit: 45
    t.string "type", limit: 255
  end

  add_index "company", ["name"], name: "comapny_name_UNIQUE", unique: true, using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "po_id",            limit: 4
    t.string   "line_item_num",    limit: 45
    t.string   "line_item_desc",   limit: 45
    t.binary   "docs_required",    limit: 1,                           default: "0"
    t.decimal  "price",                       precision: 10, scale: 2
    t.integer  "status_code",      limit: 4
    t.datetime "approved_by_date"
    t.integer  "doc_list_id",      limit: 4
  end

  add_index "items", ["line_item_num"], name: "line_item_num_UNIQUE", unique: true, using: :btree
  add_index "items", ["po_id"], name: "po_master_item_link_idx", using: :btree
  add_index "items", ["status_code"], name: "po_item_codes_idx", using: :btree

  create_table "master_pos", force: :cascade do |t|
    t.string  "po_num",       limit: 45
    t.date    "created_date"
    t.integer "project_id",   limit: 4
    t.binary  "is_active",    limit: 1
    t.integer "company_id",   limit: 4
  end

  add_index "master_pos", ["company_id"], name: "company_po_idx", using: :btree
  add_index "master_pos", ["project_id"], name: "po_project_fk_idx", using: :btree

  create_table "project_po_list", force: :cascade do |t|
    t.integer  "project_id",      limit: 4
    t.integer  "po_id",           limit: 4
    t.string   "project_name",    limit: 45
    t.string   "po_num",          limit: 45
    t.binary   "is_approved",     limit: 1
    t.datetime "approve_by_date"
    t.datetime "approval_date"
    t.string   "approved_by",     limit: 45
  end

  add_index "project_po_list", ["po_id"], name: "proj_po_link1_idx", using: :btree
  add_index "project_po_list", ["project_id"], name: "proj_link_idx", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string  "project",     limit: 45
    t.binary  "is_active",   limit: 1,  default: "0"
    t.date    "date_opened"
    t.date    "date_closed"
    t.integer "company_id",  limit: 4
  end

  add_index "projects", ["company_id"], name: "index_projects_on_company_id", using: :btree
  add_index "projects", ["project"], name: "project_name_UNIQUE", unique: true, using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer "position",    limit: 4
    t.string  "description", limit: 200
    t.string  "created_by",  limit: 255
    t.integer "company_id",  limit: 4
    t.integer "project_id",  limit: 4
  end

  add_index "tasks", ["company_id"], name: "company_po_idx", using: :btree
  add_index "tasks", ["project_id"], name: "project_id_idx", using: :btree

  create_table "test_1", id: false, force: :cascade do |t|
    t.integer "TEST", limit: 4
  end

  create_table "user_company", id: false, force: :cascade do |t|
    t.string   "user_name",    limit: 45
    t.integer  "company_id",   limit: 1
    t.binary   "is_active",    limit: 1
    t.datetime "created_date"
  end

  add_index "user_company", ["company_id"], name: "company_id_UNIQUE", unique: true, using: :btree
  add_index "user_company", ["user_name"], name: "user_name_UNIQUE", unique: true, using: :btree

  create_table "user_company_roles", force: :cascade do |t|
    t.string  "user_name",  limit: 45
    t.integer "company_id", limit: 4
    t.integer "role_code",  limit: 4
    t.binary  "is_active",  limit: 1
  end

  add_index "user_company_roles", ["company_id"], name: "comp_role_comp_idx", using: :btree
  add_index "user_company_roles", ["role_code"], name: "comp_role_role_idx", using: :btree
  add_index "user_company_roles", ["user_name", "company_id", "role_code"], name: "company_role_unique", unique: true, using: :btree

  create_table "user_config", force: :cascade do |t|
    t.string  "company",     limit: 255
    t.string  "role",        limit: 255
    t.integer "customer_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name",      limit: 45
    t.string "last_name",       limit: 45
    t.string "email",           limit: 75,  default: ""
    t.string "username",        limit: 45
    t.string "password_digest", limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "user_name_idx", using: :btree

end

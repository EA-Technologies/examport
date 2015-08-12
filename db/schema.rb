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

ActiveRecord::Schema.define(version: 20150812050105) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id",            limit: 4
    t.text     "text",                   limit: 65535
    t.text     "short_text",             limit: 65535
    t.text     "help_text",              limit: 65535
    t.integer  "weight",                 limit: 4
    t.string   "response_class",         limit: 255
    t.string   "reference_identifier",   limit: 255
    t.string   "data_export_identifier", limit: 255
    t.string   "common_namespace",       limit: 255
    t.string   "common_identifier",      limit: 255
    t.integer  "display_order",          limit: 4
    t.boolean  "is_exclusive",           limit: 1
    t.integer  "display_length",         limit: 4
    t.string   "custom_class",           limit: 255
    t.string   "custom_renderer",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_value",          limit: 255
    t.string   "api_id",                 limit: 255
    t.string   "display_type",           limit: 255
    t.string   "input_mask",             limit: 255
    t.string   "input_mask_placeholder", limit: 255
    t.string   "original_choice",        limit: 255
    t.boolean  "is_comment",             limit: 1,     default: false
    t.integer  "column_id",              limit: 4
    t.boolean  "is_correct",             limit: 1,     default: false
  end

  add_index "answers", ["api_id"], name: "uq_answers_api_id", unique: true, using: :btree

  create_table "columns", force: :cascade do |t|
    t.integer  "question_group_id", limit: 4
    t.text     "text",              limit: 65535
    t.text     "answers_textbox",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependencies", force: :cascade do |t|
    t.integer  "question_id",       limit: 4
    t.integer  "question_group_id", limit: 4
    t.string   "rule",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependency_conditions", force: :cascade do |t|
    t.integer  "dependency_id",  limit: 4
    t.string   "rule_key",       limit: 255
    t.integer  "question_id",    limit: 4
    t.string   "operator",       limit: 255
    t.integer  "answer_id",      limit: 4
    t.datetime "datetime_value"
    t.integer  "integer_value",  limit: 4
    t.float    "float_value",    limit: 24
    t.string   "unit",           limit: 255
    t.text     "text_value",     limit: 65535
    t.string   "string_value",   limit: 255
    t.string   "response_other", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "column_id",      limit: 4
  end

  create_table "question_groups", force: :cascade do |t|
    t.text     "text",                   limit: 65535
    t.text     "help_text",              limit: 65535
    t.string   "reference_identifier",   limit: 255
    t.string   "data_export_identifier", limit: 255
    t.string   "common_namespace",       limit: 255
    t.string   "common_identifier",      limit: 255
    t.string   "display_type",           limit: 255
    t.string   "custom_class",           limit: 255
    t.string   "custom_renderer",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id",                 limit: 255
  end

  add_index "question_groups", ["api_id"], name: "uq_question_groups_api_id", unique: true, using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_section_id",      limit: 4
    t.integer  "question_group_id",      limit: 4
    t.text     "text",                   limit: 65535
    t.text     "short_text",             limit: 65535
    t.text     "help_text",              limit: 65535
    t.string   "pick",                   limit: 255
    t.string   "reference_identifier",   limit: 255
    t.string   "data_export_identifier", limit: 255
    t.string   "common_namespace",       limit: 255
    t.string   "common_identifier",      limit: 255
    t.integer  "display_order",          limit: 4
    t.string   "display_type",           limit: 255
    t.boolean  "is_mandatory",           limit: 1
    t.integer  "display_width",          limit: 4
    t.string   "custom_class",           limit: 255
    t.string   "custom_renderer",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "correct_answer_id",      limit: 4
    t.string   "api_id",                 limit: 255
    t.boolean  "modifiable",             limit: 1,     default: true
    t.boolean  "dynamically_generate",   limit: 1,     default: false
    t.string   "dummy_blob",             limit: 255
    t.string   "dynamic_source",         limit: 255
    t.string   "report_code",            limit: 255
    t.boolean  "is_comment",             limit: 1,     default: false
  end

  add_index "questions", ["api_id"], name: "uq_questions_api_id", unique: true, using: :btree

  create_table "response_sets", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "survey_id",    limit: 4
    t.string   "access_code",  limit: 255
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id",       limit: 255
    t.boolean  "test_data",    limit: 1,   default: false
  end

  add_index "response_sets", ["access_code"], name: "response_sets_ac_idx", unique: true, using: :btree
  add_index "response_sets", ["api_id"], name: "uq_response_sets_api_id", unique: true, using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "response_set_id",   limit: 4
    t.integer  "question_id",       limit: 4
    t.integer  "answer_id",         limit: 4
    t.datetime "datetime_value"
    t.integer  "integer_value",     limit: 4
    t.float    "float_value",       limit: 24
    t.string   "unit",              limit: 255
    t.text     "text_value",        limit: 65535
    t.string   "string_value",      limit: 255
    t.string   "response_other",    limit: 255
    t.string   "response_group",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_section_id", limit: 4
    t.string   "api_id",            limit: 255
    t.string   "blob",              limit: 255
    t.integer  "column_id",         limit: 4
  end

  add_index "responses", ["api_id"], name: "uq_responses_api_id", unique: true, using: :btree
  add_index "responses", ["survey_section_id"], name: "index_responses_on_survey_section_id", using: :btree

  create_table "rows", force: :cascade do |t|
    t.integer  "question_group_id", limit: 4
    t.string   "text",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "survey_sections", force: :cascade do |t|
    t.integer  "survey_id",              limit: 4
    t.string   "title",                  limit: 255
    t.text     "description",            limit: 65535
    t.string   "reference_identifier",   limit: 255
    t.string   "data_export_identifier", limit: 255
    t.string   "common_namespace",       limit: 255
    t.string   "common_identifier",      limit: 255
    t.integer  "display_order",          limit: 4
    t.string   "custom_class",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "modifiable",             limit: 1,     default: true
  end

  create_table "survey_translations", force: :cascade do |t|
    t.integer  "survey_id",   limit: 4
    t.string   "locale",      limit: 255
    t.text     "translation", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title",                  limit: 255
    t.text     "description",            limit: 65535
    t.string   "access_code",            limit: 255
    t.string   "reference_identifier",   limit: 255
    t.string   "data_export_identifier", limit: 255
    t.string   "common_namespace",       limit: 255
    t.string   "common_identifier",      limit: 255
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.string   "css_url",                limit: 255
    t.string   "custom_class",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_order",          limit: 4
    t.string   "api_id",                 limit: 255
    t.integer  "survey_version",         limit: 4,     default: 0
    t.boolean  "template",               limit: 1,     default: false
    t.integer  "user_id",                limit: 4
    t.string   "test_name",              limit: 255
  end

  add_index "surveys", ["access_code", "survey_version"], name: "surveys_access_code_version_idx", unique: true, using: :btree
  add_index "surveys", ["api_id"], name: "uq_surveys_api_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "validation_conditions", force: :cascade do |t|
    t.integer  "validation_id",  limit: 4
    t.string   "rule_key",       limit: 255
    t.string   "operator",       limit: 255
    t.integer  "question_id",    limit: 4
    t.integer  "answer_id",      limit: 4
    t.datetime "datetime_value"
    t.integer  "integer_value",  limit: 4
    t.float    "float_value",    limit: 24
    t.string   "unit",           limit: 255
    t.text     "text_value",     limit: 65535
    t.string   "string_value",   limit: 255
    t.string   "response_other", limit: 255
    t.string   "regexp",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "validations", force: :cascade do |t|
    t.integer  "answer_id",  limit: 4
    t.string   "rule",       limit: 255
    t.string   "message",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

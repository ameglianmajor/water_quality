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

ActiveRecord::Schema.define(version: 20150301024457) do

  create_table "complete_factor_models", force: true do |t|
    t.float    "normalized_chloroform_weight",           limit: 24
    t.float    "normalized_bromoform_weight",            limit: 24
    t.float    "normalized_bromodichloromethane_weight", limit: 24
    t.float    "normalized_arsenic_weight",              limit: 24
    t.float    "normalized_nitrate_weight",              limit: 24
    t.float    "normalized_alpha_activity_weight",       limit: 24
    t.float    "normalized_beta_activity_weight",        limit: 24
    t.float    "normalized_radium_226_weight",           limit: 24
    t.float    "normalized_radium_228_weight",           limit: 24
    t.float    "normalized_tritium_weight",              limit: 24
    t.float    "normalized_strontium_90_weight",         limit: 24
    t.float    "normalized_uranium_weight",              limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.float    "normalized_dibromochloromethane_weight", limit: 24
  end

  create_table "complete_factor_models_user_preferences", id: false, force: true do |t|
    t.integer "complete_factor_model_id", null: false
    t.integer "user_preference_id",       null: false
  end

  add_index "complete_factor_models_user_preferences", ["complete_factor_model_id", "user_preference_id"], name: "cfmup", unique: true, using: :btree

  create_table "contaminant_normalizations", force: true do |t|
    t.string   "contaminant"
    t.float    "normalization_factor", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forem_categories", force: true do |t|
    t.string   "name",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "position",   default: 0
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true, using: :btree

  create_table "forem_forums", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", default: 0
    t.string  "slug"
    t.integer "position",    default: 0
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true, using: :btree

  create_table "forem_groups", force: true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name", using: :btree

  create_table "forem_memberships", force: true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id", using: :btree

  create_table "forem_moderator_groups", force: true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id", using: :btree

  create_table "forem_posts", force: true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
    t.string   "state",       default: "pending_review"
    t.boolean  "notified",    default: false
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id", using: :btree
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state", using: :btree
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id", using: :btree
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id", using: :btree

  create_table "forem_subscriptions", force: true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",       default: false,            null: false
    t.boolean  "pinned",       default: false
    t.boolean  "hidden",       default: false
    t.datetime "last_post_at"
    t.string   "state",        default: "pending_review"
    t.integer  "views_count",  default: 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id", using: :btree
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true, using: :btree
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state", using: :btree
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id", using: :btree

  create_table "forem_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             default: 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at", using: :btree
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id", using: :btree
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_viewable_id", using: :btree

  create_table "trihalomethane_factor_models", force: true do |t|
    t.float    "chloroform_weight",           limit: 24
    t.float    "bromoform_weight",            limit: 24
    t.float    "bromodichloromethane_weight", limit: 24
    t.float    "dibromochloromethane_weight", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "trihalomethane_factor_models_user_preferences", id: false, force: true do |t|
    t.integer "trihalomethane_factor_model_id", null: false
    t.integer "user_preference_id",             null: false
  end

  add_index "trihalomethane_factor_models_user_preferences", ["trihalomethane_factor_model_id", "user_preference_id"], name: "tfmup", unique: true, using: :btree

  create_table "user_preferences", force: true do |t|
    t.boolean  "display_chloroform"
    t.boolean  "display_bromoform"
    t.boolean  "display_bromodichloromethane"
    t.boolean  "display_dibromochloromethane"
    t.boolean  "display_arsenic"
    t.boolean  "display_nitrate"
    t.boolean  "display_alpha_activity"
    t.boolean  "display_beta_activity"
    t.boolean  "display_radium_226"
    t.boolean  "display_radium_228"
    t.boolean  "display_tritium"
    t.boolean  "display_strontium_90"
    t.boolean  "display_uranium"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",               null: false
    t.string   "encrypted_password",     default: "",               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_preference_id"
    t.boolean  "forem_admin",            default: false
    t.string   "forem_state",            default: "pending_review"
    t.boolean  "forem_auto_subscribe",   default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "water_samples", force: true do |t|
    t.string   "site"
    t.float    "chloroform",           limit: 24
    t.float    "bromoform",            limit: 24
    t.float    "bromodichloromethane", limit: 24
    t.float    "dibromochloromethane", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "arsenic",              limit: 24
    t.float    "nitrate",              limit: 24
    t.float    "alpha_activity",       limit: 24
    t.float    "beta_activity",        limit: 24
    t.float    "radium_226",           limit: 24
    t.float    "radium_228",           limit: 24
    t.float    "tritium",              limit: 24
    t.float    "strontium_90",         limit: 24
    t.float    "uranium",              limit: 24
  end

end

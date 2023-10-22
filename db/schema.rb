# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_10_22_075522) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "profile_message"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "free_entries", force: :cascade do |t|
    t.integer "training_post_id", null: false
    t.string "exercise"
    t.decimal "kg"
    t.integer "rep", default: 0, null: false
    t.integer "set", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meal_comments", force: :cascade do |t|
    t.integer "meal_post_id", null: false
    t.integer "customer_id", null: false
    t.text "comment_content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_meal_comments_on_customer_id"
    t.index ["meal_post_id"], name: "index_meal_comments_on_meal_post_id"
  end

  create_table "meal_favs", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "meal_post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_meal_favs_on_customer_id"
    t.index ["meal_post_id"], name: "index_meal_favs_on_meal_post_id"
  end

  create_table "meal_posts", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.string "meal_image"
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_meal_posts_on_customer_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "followed_id", null: false
    t.integer "follower_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.boolean "done"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "training_comments", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "training_post_id", null: false
    t.text "comment_content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_training_comments_on_customer_id"
    t.index ["training_post_id"], name: "index_training_comments_on_training_post_id"
  end

  create_table "training_favs", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "training_post_id", null: false
    t.index ["customer_id", "training_post_id"], name: "index_training_favs_on_customer_id_and_training_post_id", unique: true
    t.index ["customer_id"], name: "index_training_favs_on_customer_id"
    t.index ["training_post_id"], name: "index_training_favs_on_training_post_id"
  end

  create_table "training_menus", force: :cascade do |t|
    t.integer "training_post_id", null: false
    t.integer "training_tag_id", null: false
    t.decimal "kg", null: false
    t.integer "rep", default: 0, null: false
    t.integer "set", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["training_post_id"], name: "index_training_menus_on_training_post_id"
    t.index ["training_tag_id"], name: "index_training_menus_on_training_tag_id"
  end

  create_table "training_posts", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "training_tags", force: :cascade do |t|
    t.string "training_tag", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weights", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.decimal "weight", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_weights_on_customer_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "free_entries", "training_posts"
  add_foreign_key "meal_comments", "customers"
  add_foreign_key "meal_comments", "meal_posts"
  add_foreign_key "meal_favs", "customers"
  add_foreign_key "meal_favs", "meal_posts"
  add_foreign_key "meal_posts", "customers"
  add_foreign_key "relationships", "customers", column: "followed_id"
  add_foreign_key "relationships", "customers", column: "follower_id"
  add_foreign_key "tasks", "projects"
  add_foreign_key "training_comments", "customers"
  add_foreign_key "training_comments", "training_posts"
  add_foreign_key "training_favs", "customers"
  add_foreign_key "training_favs", "training_posts"
  add_foreign_key "training_menus", "training_posts"
  add_foreign_key "training_menus", "training_tags"
  add_foreign_key "training_posts", "customers"
  add_foreign_key "weights", "customers"
end

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

ActiveRecord::Schema.define(version: 2021_11_05_171112) do

  create_table "bookmark", primary_key: ["user_id", "product_id"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.index ["product_id"], name: "FK_bookmark_product_id_idx"
    t.index ["user_id"], name: "FK_bookmark_user_id_idx"
  end

  create_table "cart", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["product_id"], name: "FK_cart_product_id_idx"
    t.index ["user_id"], name: "FK_cart_user_id_idx"
  end

  create_table "cart_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.integer "product_id"
    t.bigint "cart_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "order_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["order_id"], name: "FK_Order_item_orderid_idx"
    t.index ["product_id"], name: "FK_order_item_productid_idx"
  end

  create_table "orders", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "order_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "order_status", limit: 45, null: false
    t.datetime "shipped_date"
    t.string "comments"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["user_id"], name: "FK_order_user_id_idx"
  end

  create_table "product_reviews", primary_key: ["id", "product_id"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "id", null: false, auto_increment: true
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.string "title", limit: 256, null: false
    t.string "content", limit: 256, null: false
    t.integer "rating", null: false, unsigned: true
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at"
    t.index ["product_id"], name: "FK_pr_product_id_idx"
    t.index ["user_id"], name: "user_id_idx"
    t.index ["user_id"], name: "user_id_idx_product_review"
  end

  create_table "products", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, collation: "utf8_general_ci"
    t.string "category", limit: 25, null: false, collation: "utf8_general_ci"
    t.string "summary", limit: 800, collation: "utf8_general_ci"
    t.float "price", limit: 53, null: false
    t.integer "quantity", null: false, unsigned: true
    t.string "image", limit: 100, collation: "utf8_general_ci"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at"
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.integer "mobile"
    t.string "gender", limit: 1
    t.integer "admin_privilege", limit: 1, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "status", limit: 45, null: false
    t.string "address"
    t.string "zipcode", limit: 6
  end

  add_foreign_key "bookmark", "products", name: "FK_bookmark_product_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "bookmark", "users", name: "FK_bookmark_user_id"
  add_foreign_key "cart", "products", name: "FK_cart_product_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cart", "users", name: "FK_cart_user_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "order_items", "orders", name: "FK_Order_item_orderid"
  add_foreign_key "order_items", "products", name: "FK_order_item_productid"
  add_foreign_key "orders", "users", name: "FK_order_user_id", on_update: :cascade
  add_foreign_key "product_reviews", "products", name: "FK_pr_product_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "product_reviews", "users", name: "FK_pr_user_id"
end

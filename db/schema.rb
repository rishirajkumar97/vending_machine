# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_20_160744) do

  create_table "beverage_ingredients", id: :string, limit: 36, force: :cascade do |t|
    t.string "beverage_id", limit: 36, null: false
    t.string "ingredient_id", limit: 36, null: false
    t.integer "units", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beverage_id", "ingredient_id"], name: "index_ingredient_beverage_unique", unique: true
    t.index ["beverage_id"], name: "index_beverage_ingredients_on_beverage_id"
    t.index ["ingredient_id"], name: "index_beverage_ingredients_on_ingredient_id"
  end

  create_table "beverages", id: :string, limit: 36, force: :cascade do |t|
    t.string "beverage_name", limit: 36, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beverage_name"], name: "index_beverages_on_beverage_name"
  end

  create_table "ingredients", id: :string, limit: 36, force: :cascade do |t|
    t.string "name", limit: 36, null: false
    t.integer "units", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_ingredients_on_name"
  end

  add_foreign_key "beverage_ingredients", "beverages"
  add_foreign_key "beverage_ingredients", "ingredients"
end

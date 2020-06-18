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

ActiveRecord::Schema.define(version: 2020_05_01_102933) do

  create_table "article_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "image"
    t.bigint "article_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_images_on_article_id"
  end

  create_table "articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.string "city", null: false
    t.bigint "country_id", null: false
    t.bigint "situation_id", null: false
    t.string "purpose", null: false
    t.text "content", null: false
    t.text "free_description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_articles_on_country_id"
    t.index ["situation_id"], name: "index_articles_on_situation_id"
  end

  create_table "countries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "country", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "direct_consultation_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "direct_consultation_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["direct_consultation_id"], name: "index_direct_consultation_comments_on_direct_consultation_id"
  end

  create_table "direct_consultations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "public_consultation_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "public_consultation_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["public_consultation_id"], name: "index_public_consultation_comments_on_public_consultation_id"
  end

  create_table "public_consultations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_public_consultations_on_country_id"
  end

  create_table "situations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "situation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "public_consultation_id"
    t.bigint "public_consultation_comment_id"
    t.bigint "direct_consultation_id"
    t.bigint "direct_consultation_comment_id"
    t.integer "is_read", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["direct_consultation_comment_id"], name: "index_user_notifications_on_direct_consultation_comment_id"
    t.index ["direct_consultation_id"], name: "index_user_notifications_on_direct_consultation_id"
    t.index ["public_consultation_comment_id"], name: "index_user_notifications_on_public_consultation_comment_id"
    t.index ["public_consultation_id"], name: "index_user_notifications_on_public_consultation_id"
  end

  add_foreign_key "article_images", "articles"
  add_foreign_key "articles", "countries"
  add_foreign_key "articles", "situations"
  add_foreign_key "direct_consultation_comments", "direct_consultations"
  add_foreign_key "public_consultation_comments", "public_consultations"
  add_foreign_key "public_consultations", "countries"
  add_foreign_key "user_notifications", "direct_consultation_comments"
  add_foreign_key "user_notifications", "direct_consultations"
  add_foreign_key "user_notifications", "public_consultation_comments"
  add_foreign_key "user_notifications", "public_consultations"
end

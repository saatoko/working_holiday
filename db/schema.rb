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
    t.bigint "user_id", null: false
    t.bigint "country_id", null: false
    t.bigint "situation_id", null: false
    t.string "purpose", null: false
    t.text "content", null: false
    t.text "free_description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_articles_on_country_id"
    t.index ["situation_id"], name: "index_articles_on_situation_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "countries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "country", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "direct_consultation_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "direct_consultation_id", null: false
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["direct_consultation_id"], name: "index_direct_consultation_comments_on_direct_consultation_id"
    t.index ["user_id"], name: "index_direct_consultation_comments_on_user_id"
  end

  create_table "direct_consultations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "advice_user_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["advice_user_id"], name: "index_direct_consultations_on_advice_user_id"
    t.index ["user_id"], name: "index_direct_consultations_on_user_id"
  end

  create_table "public_consultation_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "public_consultation_id", null: false
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["public_consultation_id"], name: "index_public_consultation_comments_on_public_consultation_id"
    t.index ["user_id"], name: "index_public_consultation_comments_on_user_id"
  end

  create_table "public_consultations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "country_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_public_consultations_on_country_id"
    t.index ["user_id"], name: "index_public_consultations_on_user_id"
  end

  create_table "situations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "situation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
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
    t.index ["user_id"], name: "index_user_notifications_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "nickname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.integer "age_id"
    t.integer "profession_id"
    t.integer "gender_id"
    t.text "profile"
    t.bigint "situation_id"
    t.bigint "country_id"
    t.bigint "experience_country_id"
    t.string "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["experience_country_id"], name: "index_users_on_experience_country_id"
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["situation_id"], name: "index_users_on_situation_id"
  end

  add_foreign_key "article_images", "articles"
  add_foreign_key "articles", "countries"
  add_foreign_key "articles", "situations"
  add_foreign_key "articles", "users"
  add_foreign_key "direct_consultation_comments", "direct_consultations"
  add_foreign_key "direct_consultation_comments", "users"
  add_foreign_key "direct_consultations", "users"
  add_foreign_key "direct_consultations", "users", column: "advice_user_id"
  add_foreign_key "public_consultation_comments", "public_consultations"
  add_foreign_key "public_consultation_comments", "users"
  add_foreign_key "public_consultations", "countries"
  add_foreign_key "public_consultations", "users"
  add_foreign_key "user_notifications", "direct_consultation_comments"
  add_foreign_key "user_notifications", "direct_consultations"
  add_foreign_key "user_notifications", "public_consultation_comments"
  add_foreign_key "user_notifications", "public_consultations"
  add_foreign_key "user_notifications", "users"
  add_foreign_key "users", "countries"
  add_foreign_key "users", "countries", column: "experience_country_id"
  add_foreign_key "users", "situations"
end

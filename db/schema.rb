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

ActiveRecord::Schema.define(version: 2022_02_08_005253) do

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "slug"
    t.string "link"
    t.string "content"
    t.integer "user_id"
  end

  create_table "postsubs", force: :cascade do |t|
    t.integer "post_id"
    t.integer "sub_id"
  end

  create_table "subs", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "description"
    t.integer "moderator_id"
    t.string "moderator_name"
    t.integer "user_id"
    t.integer "member_count"
    t.string "create_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "url"
    t.string "cakeday"
    t.integer "karma_score"
    t.string "password_digest"
  end

end

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

ActiveRecord::Schema.define(version: 2022_02_05_173753) do

  create_table "posts", force: :cascade do |t|
    t.text "post_title"
    t.text "post_description"
    t.text "post_url"
    t.text "post_link"
    t.text "post_content"
    t.text "post_author"
    t.integer "user_id"
    t.integer "sub_id"
  end

  create_table "subs", force: :cascade do |t|
    t.text "sub_title"
    t.text "sub_url"
    t.text "sub_description"
    t.text "sub_moderator"
    t.integer "sub_member_count"
    t.text "sub_create_date"
  end

  create_table "users", force: :cascade do |t|
    t.text "user_username"
    t.text "user_url"
    t.text "user_cakeday"
    t.integer "karma_score"
  end

end

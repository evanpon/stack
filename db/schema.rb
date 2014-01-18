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

ActiveRecord::Schema.define(version: 20140118155840) do

  create_table "answers", force: true do |t|
    t.integer  "question_id",                              null: false
    t.integer  "user_id",                                  null: false
    t.string   "content",     limit: 4000
    t.boolean  "accepted",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "commentable_id",                null: false
    t.string   "commentable_type",              null: false
    t.integer  "user_id",                       null: false
    t.string   "content",          limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "title",              limit: 500
    t.string   "content",            limit: 3000
    t.integer  "user_id",                         null: false
    t.integer  "accepted_answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["accepted_answer_id"], name: "index_questions_on_accepted_answer_id", using: :btree
  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.integer  "question_id",             null: false
    t.string   "content",     limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["question_id", "content"], name: "index_tags_on_question_id_and_content", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "votable_id",   null: false
    t.string   "votable_type", null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "user_id"], name: "index_votes_on_votable_id_and_votable_type_and_user_id", unique: true, using: :btree

end

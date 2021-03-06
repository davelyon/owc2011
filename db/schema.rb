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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110821104748) do

  create_table "admins", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_users_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "answers", :force => true do |t|
    t.string   "title"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_requests", :force => true do |t|
    t.string   "contact_type"
    t.text     "message"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "organization"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donation_campaigns", :force => true do |t|
    t.string   "title"
    t.string   "amount"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "start_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_at"
  end

  create_table "facebook_accounts", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active",              :default => false
    t.text     "stream_url"
    t.text     "access_token"
    t.text     "oauth_authorize_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "page_id"
    t.string   "page_token"
  end

  create_table "fundraisers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "image"
  end

  create_table "kids_corners", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "reason"
  end

  create_table "quizzes", :force => true do |t|
    t.string   "title"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "tickets", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "amount"
    t.integer  "quantity"
    t.integer  "fundraiser_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

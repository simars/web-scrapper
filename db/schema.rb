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

ActiveRecord::Schema.define(:version => 20120604022858) do

  create_table "items", :force => true do |t|
    t.text     "name"
    t.text     "contact"
    t.text     "description"
    t.text     "detail"
    t.text     "source"
    t.text     "link"
    t.integer  "container_id"
    t.string   "container_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.text     "phone_other"
    t.text     "address"
    t.text     "website"
    t.string   "lead_no"
    t.string   "last_name"
    t.string   "lead_source"
    t.string   "email"
    t.string   "industry"
    t.string   "secondary_email"
    t.string   "assigned_to"
    t.string   "postal_code"
    t.string   "city"
    t.string   "country"
    t.string   "state"
    t.string   "role"
    t.string   "lead_status"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "targets", :force => true do |t|
    t.string   "name"
    t.text     "location"
    t.text     "script"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "lead_source"
    t.text     "industry"
    t.text     "city"
    t.text     "state"
    t.text     "country",     :default => "India"
    t.text     "assigned_to", :default => "admin"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

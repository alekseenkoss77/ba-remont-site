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

ActiveRecord::Schema.define(:version => 20121120100212) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "content"
    t.string   "permalink"
    t.string   "preview_text"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "position"
    t.integer  "city_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.boolean  "red_class"
    t.string   "meta_keywords"
    t.string   "meta_description"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "email"
    t.string   "meta_keywords"
    t.string   "meta_description"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "meta_keywords"
    t.string   "meta_description"
  end

  create_table "imgs", :force => true do |t|
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.string   "alt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "gallery_id"
  end

  create_table "newses", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "content"
    t.string   "permalink"
    t.string   "preview_text"
    t.integer  "position"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "city_id"
    t.string   "meta_keywords"
    t.string   "meta_description"
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.string   "email"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone"
    t.string   "city_str"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "permalink"
    t.integer  "parent_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "top_menu"
    t.boolean  "main_menu"
    t.integer  "position"
    t.integer  "city_id"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "title"
    t.boolean  "sidebar"
  end

  create_table "phones", :force => true do |t|
    t.string   "phone_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "city_id"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vacancies", :force => true do |t|
    t.string   "fio"
    t.string   "speciality"
    t.integer  "city_id"
    t.string   "telephone"
    t.string   "stage"
    t.string   "inventory"
    t.string   "car"
    t.string   "study"
    t.string   "old"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

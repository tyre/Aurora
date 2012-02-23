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

ActiveRecord::Schema.define(:version => 20120223163846) do

  create_table "drivers", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "license_num"
    t.date     "dob"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "trips", :force => true do |t|
    t.integer  "vehicle_id"
    t.float    "origin_latitude"
    t.float    "origin_longitude"
    t.float    "destination_latitude"
    t.float    "destination_longitude"
    t.float    "distance"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "vehicles", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "driver_id"
  end

end

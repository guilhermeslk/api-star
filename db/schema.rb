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

ActiveRecord::Schema.define(version: 20160510230629) do

  create_table "actions", force: :cascade do |t|
    t.string   "action_type"
    t.string   "status"
    t.integer  "droplet_id"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.string   "external_id"
  end

  create_table "droplets", force: :cascade do |t|
    t.string   "name"
    t.string   "region_slug"
    t.integer  "memory"
    t.string   "disk"
    t.integer  "vcpus"
    t.string   "status"
    t.string   "image_name"
    t.integer  "external_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

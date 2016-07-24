# encoding: UTF-8
ActiveRecord::Schema.define(version: 20160724223225) do
  enable_extension "plpgsql"

  create_table "wordlists", id: false, force: :cascade do |t|
    t.string   "uuid",       null: false
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wordlists", ["uuid"], name: "index_wordlists_on_uuid", unique: true, using: :btree
end

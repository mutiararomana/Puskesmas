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

ActiveRecord::Schema.define(version: 20160312110604) do

  create_table "admins", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree

  create_table "cobaPolis", id: false, force: :cascade do |t|
    t.integer "id",   limit: 4,   default: 0, null: false
    t.string  "nama", limit: 255
  end

  create_table "jenis_kartus", force: :cascade do |t|
    t.string   "nama",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "jenis_penyakits", force: :cascade do |t|
    t.string   "nama",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "kartu_rms", force: :cascade do |t|
    t.string   "no_rm",          limit: 255
    t.string   "nama_kk",        limit: 255
    t.string   "alamat",         limit: 255
    t.integer  "kelurahan_id",   limit: 4
    t.integer  "umur",           limit: 4
    t.string   "jenis_kelamin",  limit: 255
    t.integer  "kategori_id",    limit: 4
    t.integer  "jenis_kartu_id", limit: 4
    t.string   "no_kartu",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "kartu_rms", ["jenis_kartu_id"], name: "index_kartu_rms_on_jenis_kartu_id", using: :btree
  add_index "kartu_rms", ["kategori_id"], name: "index_kartu_rms_on_kategori_id", using: :btree
  add_index "kartu_rms", ["kelurahan_id"], name: "index_kartu_rms_on_kelurahan_id", using: :btree

  create_table "kategoris", force: :cascade do |t|
    t.string   "nama",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "kelurahans", force: :cascade do |t|
    t.string   "nama",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "kunjungans", force: :cascade do |t|
    t.string   "nama",        limit: 255
    t.string   "kunjungan",   limit: 255
    t.string   "keluhan",     limit: 255
    t.integer  "poli_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "pasien_id",   limit: 4
    t.integer  "penyakit_id", limit: 4
  end

  add_index "kunjungans", ["poli_id"], name: "index_kunjungans_on_poli_id", using: :btree

  create_table "obat_masuks", force: :cascade do |t|
    t.integer  "obat_id",      limit: 4
    t.integer  "jumlah_masuk", limit: 4
    t.string   "penerimaan",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "obat_masuks", ["obat_id"], name: "index_obat_masuks_on_obat_id", using: :btree

  create_table "obats", force: :cascade do |t|
    t.string   "nama",       limit: 255
    t.integer  "stok_awal",  limit: 4
    t.integer  "stok",       limit: 4
    t.integer  "harga",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "kode",       limit: 255
    t.string   "pemakaian",  limit: 255
  end

  create_table "pasiens", force: :cascade do |t|
    t.string   "nama",           limit: 255
    t.string   "alamat",         limit: 255
    t.integer  "kelurahan_id",   limit: 4
    t.integer  "umur",           limit: 4
    t.string   "jenis_kelamin",  limit: 255
    t.integer  "kategori_id",    limit: 4
    t.integer  "jenis_kartu_id", limit: 4
    t.string   "no_kartu",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "status",         limit: 255
    t.string   "no_rm",          limit: 255
    t.date     "tanggal_lahir"
  end

  add_index "pasiens", ["jenis_kartu_id"], name: "index_pasiens_on_jenis_kartu_id", using: :btree
  add_index "pasiens", ["kategori_id"], name: "index_pasiens_on_kategori_id", using: :btree
  add_index "pasiens", ["kelurahan_id"], name: "index_pasiens_on_kelurahan_id", using: :btree

  create_table "penyakits", force: :cascade do |t|
    t.string   "nama",              limit: 255
    t.integer  "jenis_penyakit_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "kode",              limit: 255
  end

  add_index "penyakits", ["jenis_penyakit_id"], name: "index_penyakits_on_jenis_penyakit_id", using: :btree

  create_table "polis", force: :cascade do |t|
    t.string   "nama",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rekam_mediks", force: :cascade do |t|
    t.integer  "kartu_rm_id", limit: 4
    t.string   "nama",        limit: 255
    t.string   "keluhan",     limit: 255
    t.integer  "penyakit_id", limit: 4
    t.text     "terapi",      limit: 65535
    t.string   "tindakan",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "pasien_id",   limit: 4
  end

  add_index "rekam_mediks", ["kartu_rm_id"], name: "index_rekam_mediks_on_kartu_rm_id", using: :btree
  add_index "rekam_mediks", ["penyakit_id"], name: "index_rekam_mediks_on_penyakit_id", using: :btree

  create_table "resep_searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reseps", force: :cascade do |t|
    t.integer  "obat_id",      limit: 4
    t.integer  "jumlah_ambil", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "pemakaian",    limit: 255
    t.integer  "jumlah_masuk", limit: 4
    t.string   "penerimaan",   limit: 255
  end

  add_index "reseps", ["obat_id"], name: "index_reseps_on_obat_id", using: :btree

  create_table "transaksi_obats", force: :cascade do |t|
    t.integer  "obat_id",      limit: 4
    t.integer  "jumlah_masuk", limit: 4
    t.integer  "jumlah_ambil", limit: 4
    t.string   "penerimaan",   limit: 255
    t.string   "pemakaian",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "vwJumlahAmbil", id: false, force: :cascade do |t|
    t.integer "obat_id",                     limit: 4
    t.decimal "ifnull(sum(jumlah_ambil),0)",           precision: 32, default: 0, null: false
  end

  create_table "vwjumlahMasuk", id: false, force: :cascade do |t|
    t.integer "obat_id",                     limit: 4
    t.decimal "ifnull(sum(jumlah_masuk),0)",           precision: 32, default: 0, null: false
  end

  add_foreign_key "kartu_rms", "jenis_kartus"
  add_foreign_key "kartu_rms", "kategoris"
  add_foreign_key "kartu_rms", "kelurahans"
  add_foreign_key "kunjungans", "polis"
  add_foreign_key "obat_masuks", "obats"
  add_foreign_key "pasiens", "jenis_kartus"
  add_foreign_key "pasiens", "kategoris"
  add_foreign_key "pasiens", "kelurahans"
  add_foreign_key "penyakits", "jenis_penyakits"
  add_foreign_key "rekam_mediks", "kartu_rms"
  add_foreign_key "rekam_mediks", "penyakits"
  add_foreign_key "reseps", "obats"
end

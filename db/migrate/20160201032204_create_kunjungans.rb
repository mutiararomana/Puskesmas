class CreateKunjungans < ActiveRecord::Migration
  def change
    create_table :kunjungans do |t|
      t.references :kartu_rm, index: true, foreign_key: true
      t.string :nama
      t.integer :umur
      t.string :jenis_kelamin
      t.string :kunjungan
      t.string :keluhan
      t.references :poli, index: true, foreign_key: true
      t.references :kategori, index: true, foreign_key: true
      t.references :jenis_kartu, index: true, foreign_key: true
      t.string :no_kartu

      t.timestamps null: false
    end
  end
end

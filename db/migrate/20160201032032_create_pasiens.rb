class CreatePasiens < ActiveRecord::Migration
  def change
    create_table :pasiens do |t|
      t.references :kartu_rm, index: true, foreign_key: true
      t.string :nama
      t.string :alamat
      t.references :kelurahan, index: true, foreign_key: true
      t.integer :umur
      t.string :jenis_kelamin
      t.references :kategori, index: true, foreign_key: true
      t.references :jenis_kartu, index: true, foreign_key: true
      t.string :no_kartu
      t.string :no_rm
      t.string :status

      t.timestamps null: false
    end
  end
end

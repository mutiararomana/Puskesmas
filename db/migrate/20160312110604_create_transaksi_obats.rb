class CreateTransaksiObats < ActiveRecord::Migration
  def change
    create_table :transaksi_obats do |t|
      t.integer :obat_id
      t.integer :jumlah_masuk
      t.integer :jumlah_ambil
      t.string :penerimaan
      t.string :pemakaian

      t.timestamps null: false
    end
  end
end

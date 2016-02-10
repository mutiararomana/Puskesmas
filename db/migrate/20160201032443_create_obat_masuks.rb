class CreateObatMasuks < ActiveRecord::Migration
  def change
    create_table :obat_masuks do |t|
      t.references :obat, index: true, foreign_key: true
      t.integer :jumlah_masuk
      t.string :penerimaan

      t.timestamps null: false
    end
  end
end

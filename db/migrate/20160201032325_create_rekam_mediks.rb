class CreateRekamMediks < ActiveRecord::Migration
  def change
    create_table :rekam_mediks do |t|
      t.references :kartu_rm, index: true, foreign_key: true
      t.string :nama
      t.string :keluhan
      t.references :penyakit, index: true, foreign_key: true
      t.text :terapi
      t.string :tindakan
        t.references :pasien, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

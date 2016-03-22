class CreateKunjunganMediks < ActiveRecord::Migration
  def change
    create_table :kunjungan_mediks do |t|
      t.integer :pasien_id
      t.integer :penyakit_id
      t.string :kunjungan

      t.timestamps null: false
    end
  end
end

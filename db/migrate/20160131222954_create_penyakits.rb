class CreatePenyakits < ActiveRecord::Migration
  def change
    create_table :penyakits do |t|
      t.string :nama
      t.references :jenis_penyakit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

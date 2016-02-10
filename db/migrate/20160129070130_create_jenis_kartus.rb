class CreateJenisKartus < ActiveRecord::Migration
  def change
    create_table :jenis_kartus do |t|
      t.string :nama
        t.references :kategori, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

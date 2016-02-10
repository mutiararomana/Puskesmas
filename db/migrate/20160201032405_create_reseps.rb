class CreateReseps < ActiveRecord::Migration
  def change
    create_table :reseps do |t|
      t.references :obat, index: true, foreign_key: true
      t.integer :jumlah_ambil

      t.timestamps null: false
    end
  end
end

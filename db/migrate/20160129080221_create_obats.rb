class CreateObats < ActiveRecord::Migration
  def change
    create_table :obats do |t|
      t.string :nama
      t.integer :stok_awal
      t.integer :stok
      t.integer :harga

      t.timestamps null: false
    end
  end
end

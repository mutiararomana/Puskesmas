class CreateJenisPenyakits < ActiveRecord::Migration
  def change
    create_table :jenis_penyakits do |t|
      t.string :nama

      t.timestamps null: false
    end
  end
end

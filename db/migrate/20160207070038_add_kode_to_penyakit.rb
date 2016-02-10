class AddKodeToPenyakit < ActiveRecord::Migration
  def change
    add_column :penyakits, :kode, :string
  end
end

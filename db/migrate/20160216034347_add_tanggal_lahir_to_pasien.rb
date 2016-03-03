class AddTanggalLahirToPasien < ActiveRecord::Migration
  def change
    add_column :pasiens, :tanggal_lahir, :date
  end
end

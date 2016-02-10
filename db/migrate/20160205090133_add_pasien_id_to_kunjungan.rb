class AddPasienIdToKunjungan < ActiveRecord::Migration
  def change
    add_column :kunjungans, :pasien_id, :integer
  end
end

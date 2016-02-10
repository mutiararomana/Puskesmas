class AddPasienIdToRekamMedik < ActiveRecord::Migration
  def change
    add_column :rekam_mediks, :pasien_id, :integer
  end
end

class AddDokterToRekamMedik < ActiveRecord::Migration
  def change
    add_column :rekam_mediks, :dokter_id, :integer
  end
end

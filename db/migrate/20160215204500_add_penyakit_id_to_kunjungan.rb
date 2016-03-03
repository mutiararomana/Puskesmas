class AddPenyakitIdToKunjungan < ActiveRecord::Migration
  def change
    add_column :kunjungans, :penyakit_id, :integer
  end
end

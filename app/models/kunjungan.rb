class Kunjungan < ActiveRecord::Base
  belongs_to :poli
  belongs_to :kategori
  belongs_to :jenis_kartu
    belongs_to :pasien
    
    def tanggal
        self.created_at = self.created_at.to_date
    end
end

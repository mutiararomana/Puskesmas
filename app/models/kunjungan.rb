class Kunjungan < ActiveRecord::Base
  belongs_to :poli
  belongs_to :kategori
  belongs_to :jenis_kartu
    belongs_to :pasien
    belongs_to :penyakit
    validates :kunjungan, presence: true
    validates :keluhan, presence: true
    validates :poli_id, presence: true

#    after_create :medik
#    after_save :data_pasien
    
    def tanggal
        self.created_at = self.created_at.to_date
    end
    
#    
#    def medik
#        new_medik = KunjunganMedik.new
#        new_medik.pasien_id = self.pasien_id
#        new_medik.kunjungan = self.kunjungan
#        new_medik.save
#    end
#    def data_pasien
#        if (b = Pasien.where(:id => self.pasien_id).first)
#            b.umur=self.umur
#
#            self.save
#        end
#    end
end

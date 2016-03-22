class RekamMedik < ActiveRecord::Base
    belongs_to :pasien
  belongs_to :penyakit
    belongs_to :dokter
    after_create :diagnosa
    validates :keluhan, presence: true
    validates :penyakit_id, presence: true

    
    def diagnosa
        b = Kunjungan.where(:pasien_id => self.pasien_id, :created_at => (self.created_at.beginning_of_day..self.created_at.end_of_day)).first
            new_a = KunjunganMedik.new
            new_a.pasien_id = self.pasien_id
            new_a.kunjungan = b.kunjungan
            new_a.penyakit_id = self.penyakit_id
            new_a.save
    end
end

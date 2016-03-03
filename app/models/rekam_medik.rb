class RekamMedik < ActiveRecord::Base
    belongs_to :pasien
  belongs_to :penyakit
    after_save :diagnosa
    
    def diagnosa
        if (b = Kunjungan.where(:pasien_id => self.pasien_id, :created_at => (self.created_at.beginning_of_day..self.created_at.end_of_day)).first)
            b.penyakit_id = self.penyakit_id
        b.save
        end
    end
end

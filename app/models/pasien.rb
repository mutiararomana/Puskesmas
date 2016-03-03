class Pasien < ActiveRecord::Base
  belongs_to :kelurahan
  belongs_to :kategori
  belongs_to :jenis_kartu
    has_many :rekam_mediks
    has_many :kunjungans
#    after_save :umur_pasien
    
    def self.search(search)
        where("nama LIKE ?", "%#{search}%") 
    end
    
#    def umur_pasien
#        umur=((Date.today - self.tanggal_lahir) / 365).floor
#        save
#    end
    
end

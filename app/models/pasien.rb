class Pasien < ActiveRecord::Base
  belongs_to :kelurahan
  belongs_to :kategori
  belongs_to :jenis_kartu
    has_many :rekam_mediks
    has_many :kunjungans
    
    def self.search(search)
  where("nama LIKE ?", "%#{search}%") 
end
    
end

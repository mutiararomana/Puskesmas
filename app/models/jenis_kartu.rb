class JenisKartu < ActiveRecord::Base
    belongs_to :kategori
    has_many :pasiens
    has_many :kartu_rms
    has_many :kunjungans
    
    
end

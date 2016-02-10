class Kategori < ActiveRecord::Base
    has_many :jenis_kartus
    has_many :pasiens
    has_many :kunjungans
    
end

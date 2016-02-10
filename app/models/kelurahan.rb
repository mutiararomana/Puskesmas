class Kelurahan < ActiveRecord::Base
    has_many :pasiens
    has_many :kunjungans
    
    
end

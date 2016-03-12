class Obat < ActiveRecord::Base
    has_many :reseps, dependent: :destroy
    has_many :obat_masuks, dependent: :destroy
    has_many :transaksi_obats, dependent: :destroy
    validates :stok_awal, presence: true
    
    before_create :set_stok
#    after_commit :laporan
    
    def set_stok
        self.stok = stok_awal
    end
    
    def self.search(search)
        where("nama LIKE ?", "%#{search}%") 
    end
    

end

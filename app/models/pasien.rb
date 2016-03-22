class Pasien < ActiveRecord::Base
  belongs_to :kelurahan
  belongs_to :kategori
  belongs_to :jenis_kartu
    has_many :rekam_mediks, dependent: :destroy
    has_many :kunjungans, dependent: :destroy
    has_many :kunjungan_mediks, dependent: :destroy
    validates :no_rm, presence: true
    validates :nama, presence: true
    validates :status, presence: true
    validates :alamat, presence: true
    validates :tanggal_lahir, presence: true
    validates :jenis_kelamin, presence: true
    validates :kategori_id, presence: true


#    after_save :umur_pasien
    
    def self.search(search)
        where("nama LIKE ?", "%#{search}%") 
    end
    
#    def umur_pasien
#        umur=((Date.today - self.tanggal_lahir) / 365).floor
#        save
#    end
    
end

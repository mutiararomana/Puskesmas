class Penyakit < ActiveRecord::Base
  belongs_to :jenis_penyakit
    has_many :rekam_mediks, dependent: :destroy
    has_many :kunjungans, dependent: :destroy
    has_many :kunjungan_mediks, dependent: :destroy
end

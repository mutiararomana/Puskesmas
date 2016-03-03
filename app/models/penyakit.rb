class Penyakit < ActiveRecord::Base
  belongs_to :jenis_penyakit
    has_many :rekam_mediks
    has_many :kunjungans
end

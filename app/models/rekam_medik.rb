class RekamMedik < ActiveRecord::Base
    belongs_to :pasien
  belongs_to :penyakit
end

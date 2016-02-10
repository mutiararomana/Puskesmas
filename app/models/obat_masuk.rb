class ObatMasuk < ActiveRecord::Base
  belongs_to :obat
    after_save :update_obat_stok
    
    def update_obat_stok
        if (b = Obat.where(:id => self.obat_id).first)
        b.stok = self.jumlah_masuk+b.stok
        b.save
    end
    end
end

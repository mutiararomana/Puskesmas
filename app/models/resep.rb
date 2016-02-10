class Resep < ActiveRecord::Base
  belongs_to :obat
    after_save :update_obat_stok, :total_resep
    
    def update_obat_stok
        if (b = Obat.where(:id => self.obat_id).first)
            b.stok = b.stok-self.jumlah_ambil
            b.save
        end
    end
    
#    def total_resep(
#        if (a = Resep.where((:created_at.to_date => self.created_at.to_date) & (:obat_id => self.obat_id)).first)
#            a.jumlah_ambil = self.jumlah_ambil + b.jumlah_ambil
#            a.save
#        end
#    end
    
end

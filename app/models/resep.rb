class Resep < ActiveRecord::Base
  belongs_to :obat
    after_save :update_obat_stok
    after_create :new_transaksi_obat
    validates :jumlah_ambil, presence: true
    validates :pemakaian, presence: true

    
    def update_obat_stok
        if (b = Obat.where(:id => self.obat_id).first)
            b.stok = b.stok-self.jumlah_ambil
            b.save
        end
    end
    
    def new_transaksi_obat
      new_transaksi = TransaksiObat.new
        new_transaksi.obat_id = self.obat_id
        new_transaksi.jumlah_masuk = 0
        new_transaksi.penerimaan = ""
        new_transaksi.jumlah_ambil = self.jumlah_ambil
        new_transaksi.pemakaian = self.pemakaian
      new_transaksi.save
    end
    
#    def total_resep(
#        if (a = Resep.where((:created_at.to_date => self.created_at.to_date) & (:obat_id => self.obat_id)).first)
#            a.jumlah_ambil = self.jumlah_ambil + b.jumlah_ambil
#            a.save
#        end
#    end
    
end

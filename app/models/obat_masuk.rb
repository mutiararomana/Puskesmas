class ObatMasuk < ActiveRecord::Base
  belongs_to :obat
    after_save :update_obat_stok
    after_create :new_transaksi_obat
    
    def update_obat_stok
        if (b = Obat.where(:id => self.obat_id).first)
        b.stok = self.jumlah_masuk+b.stok
        b.save
    end
    end
    
    def new_transaksi_obat
      new_transaksi = TransaksiObat.new
        new_transaksi.obat_id = self.obat_id
        new_transaksi.jumlah_masuk = self.jumlah_masuk
        new_transaksi.penerimaan = self.penerimaan
        new_transaksi.jumlah_ambil = 0
        new_transaksi.pemakaian = ""
      new_transaksi.save
    end
end

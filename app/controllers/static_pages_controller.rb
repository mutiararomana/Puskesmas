class StaticPagesController < ApplicationController
    before_action :logged_in_user, only: [:home]
    
  def home
#      @pasiens=Kunjungan.all.where(:created_at => 1.month.ago.utc.beginning_of_month..1.month.ago.utc.end_of_month)
      @pasiens=KunjunganMedik.all.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month)
      @pasiens=@pasiens.joins('LEFT JOIN pasiens ON kunjungan_mediks.pasien_id = pasiens.id')
      @pasiens=@pasiens.joins('LEFT JOIN penyakits ON kunjungan_mediks.penyakit_id = penyakits.id')
      @pasiens=@pasiens.joins('LEFT JOIN jenis_penyakits ON penyakits.jenis_penyakit_id = jenis_penyakits.id')
      @pasiens=@pasiens.group('penyakits.nama').limit(10).order('count(penyakits.id) DESC')
      
      @obats = Obat.all.group('obats.nama').limit(5).order(:stok)
      
  end

  def help
  end
end

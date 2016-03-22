class ObatsController < ApplicationController
  before_action :set_obat, only: [:show, :edit, :update, :destroy]
    before_action :logged_in_user, only: [:new, :create, :update, :destroy, :laporan, :index, :show, :edit]
    before_action :laporan, only: [:cetak_laporan]


  # GET /obats
  # GET /obats.json
  def index
      if params[:search]
        @obats = Obat.search(params[:search])
      else
        @obats = Obat.all
      end
  end
    
    def search_obat_masuk
        @obats = Obat.search(params[:search])
    end
    def search_obat_keluar
        @obats = Obat.search(params[:search])
    end
    
    def laporan
#        if params[:bulan]
#            @reseps = Resep.by_month(params[:bulan], :year => params[:tahun])
#            @obat_masuks = ObatMasuk.by_month(params[:bulan], :year => params[:tahun])
#        else
#            @reseps = Resep.all
#            @obat_masuks = ObatMasuk.all
#        end
#        @reseps = @reseps.select('*, sum(reseps.jumlah_ambil) as jumlah_ambil, round(sum(if(reseps.pemakaian = "PKM" ,jumlah_ambil,0))/count(if(reseps.pemakaian="PKM", reseps.obat_id, 0))) as pkm, round(sum(if(reseps.pemakaian = "PUSTU",jumlah_ambil,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and reseps.pemakaian="PUSTU", 1, 0))) as pustu, round(sum(if(reseps.pemakaian = "POSKESKEL",jumlah_ambil,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and reseps.pemakaian="POSKESKEL", 1, 0))) as poskeskel').group('obat_id')
#        @obat_masuks = @obat_masuks.select('*, sum(obat_masuks.jumlah_masuk) as jumlah_masuk, round(sum(if(obat_masuks.penerimaan = "PKD", obat_masuks.jumlah_masuk, 0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="PKD", 1, 0))) as pkd, round(sum(if(obat_masuks.penerimaan = "ASK",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="ASK", 1, 0))) as ask, round(sum(if(obat_masuks.penerimaan = "DAK",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="DAK", 1, 0))) as dak, round(sum(if(obat_masuks.penerimaan = "PROGR",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="PROGR", 1, 0))) as progr, round(sum(if(obat_masuks.penerimaan = "POSKEL",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="POSKEL", 1, 0))) as poskel').uniq.group('obats.id')
#        @obats = Obat.all
#        @obats = @obats.joins('LEFT JOIN obat_masuks ON obat_masuks.obat_id = obats.id')
#        @obats = @obats.joins('LEFT JOIN reseps ON obat_masuks.obat_id = obats.id')
#        if params[:bulan]
#            @obats = Obat.by_month(params[:bulan], :year => params[:tahun])
#        else
#            @obats = Obat.all
#        end
#        @obats = @obats.joins('LEFT JOIN reseps ON reseps.obat_id = obats.id')
#        @obats = @obats.select('obats.id, obats.nama, obats.stok_awal, obats.stok, obats.harga, if(reseps.obat_id = obat_masuks.obat_id,round(sum(jumlah_ambil)/2),sum(jumlah_ambil)) as jumlah_ambil, if(reseps.obat_id = obat_masuks.obat_id,round(sum(if(reseps.pemakaian = "PKM", reseps.jumlah_ambil, 0))/sum(if(reseps.obat_id=obat_masuks.obat_id and reseps.pemakaian="PKM", 1, 0))),round(sum(if(reseps.pemakaian = "PKM", reseps.jumlah_ambil, 0)))) as pkm, if(reseps.obat_id = obat_masuks.obat_id,round(sum(if(reseps.pemakaian = "PUSTU" ,jumlah_ambil,0))/2),sum(if(reseps.pemakaian = "PUSTU" ,jumlah_ambil,0))) as pustu, if(reseps.obat_id = obat_masuks.obat_id,round(sum(if(reseps.pemakaian = "POSKESKEL" ,jumlah_ambil,0))/2),sum(if(reseps.pemakaian = "POSKESKEL" ,jumlah_ambil,0))) as poskeskel').uniq.group('obats.id').order('obats.id')
#        @obats = @obats.joins('LEFT JOIN obat_masuks ON obat_masuks.obat_id = obats.id')
#        @obats = @obats.select('obats.stok_awal+sum(obat_masuks.jumlah_masuk) as jumlah_masuk, if(reseps.obat_id = obat_masuks.obat_id,round(sum(if(obat_masuks.penerimaan = "PKD", obat_masuks.jumlah_masuk, 0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="PKD", 1, 0))),round(sum(if(obat_masuks.penerimaan = "PKD", obat_masuks.jumlah_masuk, 0)))) as pkd, if(reseps.obat_id = obat_masuks.obat_id,round(sum(if(obat_masuks.penerimaan = "ASK", obat_masuks.jumlah_masuk, 0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="ASK", 1, 0))),round(sum(if(obat_masuks.penerimaan = "ASK", obat_masuks.jumlah_masuk, 0)))) as ask, if(reseps.obat_id = obat_masuks.obat_id,round(sum(if(obat_masuks.penerimaan = "DAK", obat_masuks.jumlah_masuk, 0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="DAK", 1, 0))),round(sum(if(obat_masuks.penerimaan = "DAK", obat_masuks.jumlah_masuk, 0)))) as dak, if(reseps.obat_id = obat_masuks.obat_id,round(sum(if(obat_masuks.penerimaan = "PROGR", obat_masuks.jumlah_masuk, 0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="PROGR", 1, 0))),round(sum(if(obat_masuks.penerimaan = "PROGR", obat_masuks.jumlah_masuk, 0)))) as progr, if(reseps.obat_id = obat_masuks.obat_id,round(sum(if(obat_masuks.penerimaan = "POSKEL", obat_masuks.jumlah_masuk, 0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="POSKEL", 1, 0))),round(sum(if(obat_masuks.penerimaan = "POSKEL", obat_masuks.jumlah_masuk, 0)))) as poskel').uniq.group('obats.id').order('reseps.obat_id, obat_masuks.obat_id')  
#        
#        @reseps = Obat.joins('LEFT JOIN reseps ON reseps.obat_id = obats.id')
#        @reseps = @reseps.joins('LEFT JOIN obat_masuks ON obat_masuks.obat_id = obats.id').order('reseps.obat_id, obat_masuks.obat_id').select('*, obat_masuks.jumlah_masuk as jm, reseps.jumlah_ambil as ja')
        
#        if params[:bulan]
#            @obats = Obat.by_month(params[:bulan], :year => params[:tahun])
#        else
#            @obats = Obat.all
#        end
#        @obats = @obats.joins('LEFT JOIN obat_masuks ON obat_masuks.obat_id = obats.id').group('obats.id')
#        @obats = @obats.joins('LEFT JOIN reseps ON reseps.obat_id = obats.id').group('obats.id')
#        @obats = @obats.select('*, sum(reseps.jumlah_ambil) as jumlah_ambil, obats.stok_awal + sum(obat_masuks.jumlah_masuk) as jumlah_masuk, round(sum(if(reseps.pemakaian = "PKM" ,jumlah_ambil,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and reseps.pemakaian="PKM", 1, 0))) as pkm, round(sum(if(reseps.pemakaian = "PUSTU",jumlah_ambil,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and reseps.pemakaian="PUSTU", 1, 0))) as pustu, round(sum(if(reseps.pemakaian = "POSKESKEL",jumlah_ambil,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and reseps.pemakaian="POSKESKEL", 1, 0))) as poskeskel, round(sum(if(obat_masuks.penerimaan = "PKD", obat_masuks.jumlah_masuk, 0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="PKD", 1, 0))) as pkd, round(sum(if(obat_masuks.penerimaan = "ASK",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="ASK", 1, 0))) as ask, round(sum(if(obat_masuks.penerimaan = "DAK",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="DAK", 1, 0))) as dak, round(sum(if(obat_masuks.penerimaan = "PROGR",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="PROGR", 1, 0))) as progr, round(sum(if(obat_masuks.penerimaan = "POSKEL",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="POSKEL", 1, 0))) as poskel').group('obats.id')  
        
        if params[:bulan]
            @obats = Obat.by_month(params[:bulan], :year => params[:tahun])
        else
            @obats = Obat.all
        end
        
        @obats = @obats.joins('LEFT JOIN transaksi_obats ON transaksi_obats.obat_id = obats.id')
        @obats = @obats.select('*, ifnull(sum(transaksi_obats.jumlah_ambil),0) as jumlah_ambil, (obats.stok_awal + ifnull(sum(transaksi_obats.jumlah_masuk),0)) as jumlah_masuk, ifnull(sum(if(transaksi_obats.penerimaan = "PKD", jumlah_masuk, 0)),0) as pkd, ifnull(sum(if(transaksi_obats.penerimaan = "ASK", jumlah_masuk, 0)),0) as ask, ifnull(sum(if(transaksi_obats.penerimaan = "DAK", jumlah_masuk, 0)),0) as dak, ifnull(sum(if(transaksi_obats.penerimaan = "PROGR", jumlah_masuk, 0)),0) as progr, ifnull(sum(if(transaksi_obats.penerimaan = "POSKEL", jumlah_masuk, 0)),0) as poskel, ifnull(sum(if(transaksi_obats.pemakaian = "PKM", jumlah_ambil, 0)),0) as pkm, ifnull(sum(if(transaksi_obats.pemakaian = "PUSTU", jumlah_ambil, 0)),0) as pustu, ifnull(sum(if(transaksi_obats.pemakaian = "POSKESKEL", jumlah_ambil, 0)),0) as poskeskel').group('obats.id')
        
    end

  def cetak_laporan
      respond_to do |format|
            format.html { render }
            format.pdf do
                render pdf: "lb2", :template => 'obats/cetak_laporan.html.erb', :orientation => 'Landscape', :outline => {:outline => true}
            end
        end
  end
    
  # GET /obats/1
  # GET /obats/1.json
  def show
  end

  # GET /obats/new
  def new
    @obat = Obat.new
  end

  # GET /obats/1/edit
  def edit
  end

  # POST /obats
  # POST /obats.json
  def create
    @obat = Obat.new(obat_params)

    respond_to do |format|
      if @obat.save
        format.html { redirect_to obats_path, notice: 'Obat was successfully created.' }
#        format.json { render :show, status: :created, location: @obat }
      else
        format.html { render :new }
        format.json { render json: @obat.errors, status: :unprocessable_entity }
      end
    end
  end

    
    
  # PATCH/PUT /obats/1
  # PATCH/PUT /obats/1.json
  def update
    respond_to do |format|
      if @obat.update(obat_params)
        format.html { redirect_to @obat, notice: 'Obat was successfully updated.' }
        format.json { render :show, status: :ok, location: @obat }
      else
        format.html { render :edit }
        format.json { render json: @obat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obats/1
  # DELETE /obats/1.json
  def destroy
    @obat.destroy
    respond_to do |format|
      format.html { redirect_to obats_url, notice: 'Obat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obat
      @obat = Obat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obat_params
        params.require(:obat).permit(:nama, :kode, :stok_awal, :stok, :harga, :satuan)
    end
end

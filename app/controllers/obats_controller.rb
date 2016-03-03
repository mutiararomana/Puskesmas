class ObatsController < ApplicationController
  before_action :set_obat, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]


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
        if params[:bulan]
            @obats = Obat.by_month(params[:bulan], :year => params[:tahun])
        else
            @obats = Obat.all
        end
        @obats = @obats.joins('LEFT JOIN obat_masuks ON obat_masuks.obat_id = obats.id').group('obats.id')
        @obats = @obats.joins('LEFT JOIN reseps ON reseps.obat_id = obats.id').group('obats.id')
        @obats = @obats.select('*, sum(reseps.jumlah_ambil) as jumlah_ambil, sum(obat_masuks.jumlah_masuk) as jumlah_masuk, round(sum(if(reseps.pemakaian = "PKM" ,jumlah_ambil,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and reseps.pemakaian="PKM", 1, 0))) as pkm, round(sum(if(reseps.pemakaian = "PUSTU",jumlah_ambil,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and reseps.pemakaian="PUSTU", 1, 0))) as pustu, round(sum(if(reseps.pemakaian = "POSKESKEL",jumlah_ambil,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and reseps.pemakaian="POSKESKEL", 1, 0))) as poskeskel, round(sum(if(obat_masuks.penerimaan = "PKD", obat_masuks.jumlah_masuk, 0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="PKD", 1, 0))) as pkd, round(sum(if(obat_masuks.penerimaan = "ASK",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="ASK", 1, 0))) as ask, round(sum(if(obat_masuks.penerimaan = "DAK",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="DAK", 1, 0))) as dak, round(sum(if(obat_masuks.penerimaan = "PROGR",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="PROGR", 1, 0))) as progr, round(sum(if(obat_masuks.penerimaan = "POSKEL",obat_masuks.jumlah_masuk,0))/sum(if(reseps.obat_id=obat_masuks.obat_id and obat_masuks.penerimaan="POSKEL", 1, 0))) as poskel').uniq.group('obats.id')  
        
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
        params.require(:obat).permit(:nama, :kode, :stok_awal, :stok, :harga)
    end
end

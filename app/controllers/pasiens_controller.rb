class PasiensController < ApplicationController
    before_action :set_pasien, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :update, :destroy, :laporan]

#    after_action :set_umur, only:[:create]

  # GET /pasiens
  # GET /pasiens.json
  def index
  if params[:search]
    @pasiens = Pasien.search(params[:search]).order("nama ASC")
  else
      @pasiens = Pasien.all.order('nama ASC')
  end
  respond_to do |format|
    format.html { render }
    format.pdf do
        render pdf: "rekam_medik", :template => 'pasiens/index.html.erb'
    end
  end
  end
    
#    def set_umur
#        @pasien = Pasien.find(params[:id])
#        @pasien.umur =((Date.today - self.tanggal_lahir) / 365).floor
#        @pasien.save
#    end
    
    def search
        @pasiens = Pasien.search(params[:search])
        
    end
  # GET /pasiens/1
  # GET /pasiens/1.json
    def rekam_medik
        @pasien = Pasien.find(params[:id])
        
        respond_to do |format|
            format.html { render }
            format.pdf do
                render pdf: "rekam_medik", :template => 'pasiens/rekam_medik.html.erb'
            end
        end
    end
    
    def laporan
        if params[:bulan]
            @pasiens = Pasien.by_month(params[:bulan], :year => params[:tahun])
        else
            @pasiens = Pasien.all
        end
        @pasiens=@pasiens.joins('LEFT JOIN kunjungans ON kunjungans.pasien_id = pasiens.id')
        @pasiens=@pasiens.joins('LEFT JOIN penyakits ON kunjungans.penyakit_id = penyakits.id')
        @pasiens=@pasiens.joins('LEFT JOIN jenis_penyakits ON penyakits.jenis_penyakit_id = jenis_penyakits.id')
        @pasiens=@pasiens.select('penyakits.kode as kode_penyakit, penyakits.nama as nama_penyakit, jenis_penyakits.nama as jenis_penyakit, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="B" and pasiens.umur<1,1,0)) as j1, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="B" and pasiens.umur<1,1,0)) as j2, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="L" and pasiens.umur<1,1,0)) as j3, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="L" and pasiens.umur<1,1,0)) as j4, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="B" and pasiens.umur>=1 and pasiens.umur<=4,1,0)) as j5, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="B" and pasiens.umur>=1 and pasiens.umur<=4,1,0)) as j6, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="L" and pasiens.umur>=1 and pasiens.umur<=4,1,0)) as j7, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="L" and pasiens.umur>=1 and pasiens.umur<=4,1,0)) as j8, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="B" and pasiens.umur>=5 and pasiens.umur<=9,1,0)) as j9, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="B" and pasiens.umur>=5 and pasiens.umur<=9,1,0)) as j10, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="L" and pasiens.umur>=5 and pasiens.umur<=9,1,0)) as j11, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="L" and pasiens.umur>=5 and pasiens.umur<=9,1,0)) as j12, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="B" and pasiens.umur>=10 and pasiens.umur<=14,1,0)) as j13, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="B" and pasiens.umur>=10 and pasiens.umur<=14,1,0)) as j14, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="L" and pasiens.umur>=10 and pasiens.umur<=14,1,0)) as j15, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="L" and pasiens.umur>=10 and pasiens.umur<=14,1,0)) as j16, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="B" and pasiens.umur>=15 and pasiens.umur<=19,1,0)) as j17, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="B" and pasiens.umur>=15 and pasiens.umur<=19,1,0)) as j18, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="L" and pasiens.umur>=15 and pasiens.umur<=19,1,0)) as j19, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="L" and pasiens.umur>=15 and pasiens.umur<=19,1,0)) as j20, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="B" and pasiens.umur>=20 and pasiens.umur<=44,1,0)) as j21, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="B" and pasiens.umur>=20 and pasiens.umur<=44,1,0)) as j22, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="L" and pasiens.umur>=20 and pasiens.umur<=44,1,0)) as j23, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="L" and pasiens.umur>=20 and pasiens.umur<=44,1,0)) as j24, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="B" and pasiens.umur>=45 and pasiens.umur<=54,1,0)) as j25, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="B" and pasiens.umur>=45 and pasiens.umur<=54,1,0)) as j26, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="L" and pasiens.umur>=45 and pasiens.umur<=54,1,0)) as j27, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="L" and pasiens.umur>=45 and pasiens.umur<=54,1,0)) as j28, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="B" and pasiens.umur>=55 and pasiens.umur<=59,1,0)) as j29, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="B" and pasiens.umur>=55 and pasiens.umur<=59,1,0)) as j30, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="L" and pasiens.umur>=55 and pasiens.umur<=59,1,0)) as j31, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="L" and pasiens.umur>=55 and pasiens.umur<=59,1,0)) as j32, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="B" and pasiens.umur>=60,1,0)) as j33, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="B" and pasiens.umur>=60,1,0)) as j34, sum(if(pasiens.jenis_kelamin="L" and kunjungans.kunjungan="L" and pasiens.umur>=60,1,0)) as j35, sum(if(pasiens.jenis_kelamin="P" and kunjungans.kunjungan="L" and pasiens.umur>=60,1,0)) as j36').group('penyakits.id')
    end
    
    
  # GET /pasiens/1
  # GET /pasiens/1.json
  def show
      @keluarga = Pasien.where(:no_rm => @pasien.no_rm).order('status DESC')
  end

  # GET /pasiens/new
  def new
    @pasien = Pasien.new
  end

  # GET /pasiens/1/edit
  def edit
  end

  # POST /pasiens
  # POST /pasiens.json
  def create
    @pasien = Pasien.new(pasien_params)

    respond_to do |format|
      if @pasien.save
          @pasien.umur =((Date.today - @pasien.tanggal_lahir) / 365).floor
        @pasien.save
        format.html { redirect_to @pasien, notice: 'Pasien was successfully created.' }
        format.json { render :show, status: :created, location: @pasien }
      else
        format.html { render :new }
        format.json { render json: @pasien.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pasiens/1
  # PATCH/PUT /pasiens/1.json
  def update
    respond_to do |format|
      if @pasien.update(pasien_params)
        format.html { redirect_to @pasien, notice: 'Pasien was successfully updated.' }
        format.json { render :show, status: :ok, location: @pasien }
      else
        format.html { render :edit }
        format.json { render json: @pasien.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasiens/1
  # DELETE /pasiens/1.json
  def destroy
    @pasien.destroy
    respond_to do |format|
      format.html { redirect_to pasiens_url, notice: 'Pasien was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pasien
      @pasien = Pasien.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pasien_params
      params.require(:pasien).permit( :nama, :alamat, :kelurahan_id, :umur, :jenis_kelamin, :kategori_id, :jenis_kartu_id, :no_kartu, :no_rm, :status, :tanggal_lahir)
    end
end

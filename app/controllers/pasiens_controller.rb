class PasiensController < ApplicationController
    before_action :set_pasien, only: [:show, :edit, :update, :destroy]

  # GET /pasiens
  # GET /pasiens.json
  def index
  if params[:search]
    @pasiens = Pasien.search(params[:search]).order("nama ASC")
  else
      @pasiens = Pasien.all.order('nama ASC')
  end
  end
    
    def search
        @pasiens = Pasien.search(params[:search])
    end
  # GET /pasiens/1
  # GET /pasiens/1.json
    def rekam_medik
        @pasien = Pasien.find(params[:id])
    end
    
    
  # GET /pasiens/1
  # GET /pasiens/1.json
  def show
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
      params.require(:pasien).permit( :nama, :alamat, :kelurahan_id, :umur, :jenis_kelamin, :kategori_id, :jenis_kartu_id, :no_kartu, :no_rm, :status)
    end
end

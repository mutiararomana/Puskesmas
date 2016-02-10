class KunjungansController < ApplicationController
  before_action :set_kunjungan, only: [:show, :edit, :update, :destroy]

  # GET /kunjungans
  # GET /kunjungans.json
  def index
    if params[:search_date]
          time = Date.parse(params[:search_date])
          @kunjungans = Kunjungan.where(:created_at => (time.beginning_of_day..time.end_of_day))
      else
          @kunjungans = Kunjungan.all
      end
  end

  # GET /kunjungans/1
  # GET /kunjungans/1.json
  def show
  end

  # GET /kunjungans/new
  def new
    @kunjungan = Kunjungan.new
  end

  # GET /kunjungans/1/edit
  def edit
  end

  # POST /kunjungans
  # POST /kunjungans.json
  def create
    @kunjungan = Kunjungan.new(kunjungan_params)

    respond_to do |format|
      if @kunjungan.save
        format.html { redirect_to @kunjungan, notice: 'Kunjungan was successfully created.' }
        format.json { render :show, status: :created, location: @kunjungan }
      else
        format.html { render :new }
        format.json { render json: @kunjungan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kunjungans/1
  # PATCH/PUT /kunjungans/1.json
  def update
    respond_to do |format|
      if @kunjungan.update(kunjungan_params)
        format.html { redirect_to @kunjungan, notice: 'Kunjungan was successfully updated.' }
        format.json { render :show, status: :ok, location: @kunjungan }
      else
        format.html { render :edit }
        format.json { render json: @kunjungan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kunjungans/1
  # DELETE /kunjungans/1.json
  def destroy
    @kunjungan.destroy
    respond_to do |format|
      format.html { redirect_to kunjungans_url, notice: 'Kunjungan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kunjungan
      @kunjungan = Kunjungan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kunjungan_params
        params.require(:kunjungan).permit(:pasien_id, :nama, :umur, :jenis_kelamin, :kunjungan, :keluhan, :poli_id, :kategori_id, :jenis_kartu_id, :no_kartu)
    end
end

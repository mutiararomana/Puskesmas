class ObatMasuksController < ApplicationController
  before_action :set_obat_masuk, only: [:show, :edit, :update, :destroy]

  # GET /obat_masuks
  # GET /obat_masuks.json
  def index
    @obat_masuks = ObatMasuk.all
  end

  # GET /obat_masuks/1
  # GET /obat_masuks/1.json
  def show
  end

  # GET /obat_masuks/new
  def new
    @obat_masuk = ObatMasuk.new
  end

  # GET /obat_masuks/1/edit
  def edit
  end

  # POST /obat_masuks
  # POST /obat_masuks.json
  def create
    @obat_masuk = ObatMasuk.new(obat_masuk_params)

    respond_to do |format|
      if @obat_masuk.save
        format.html { redirect_to @obat_masuk, notice: 'Obat masuk was successfully created.' }
        format.json { render :show, status: :created, location: @obat_masuk }
      else
        format.html { render :new }
        format.json { render json: @obat_masuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /obat_masuks/1
  # PATCH/PUT /obat_masuks/1.json
  def update
    respond_to do |format|
      if @obat_masuk.update(obat_masuk_params)
        format.html { redirect_to @obat_masuk, notice: 'Obat masuk was successfully updated.' }
        format.json { render :show, status: :ok, location: @obat_masuk }
      else
        format.html { render :edit }
        format.json { render json: @obat_masuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obat_masuks/1
  # DELETE /obat_masuks/1.json
  def destroy
    @obat_masuk.destroy
    respond_to do |format|
      format.html { redirect_to obat_masuks_url, notice: 'Obat masuk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obat_masuk
      @obat_masuk = ObatMasuk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obat_masuk_params
      params.require(:obat_masuk).permit(:obat_id, :jumlah_masuk, :penerimaan)
    end
end

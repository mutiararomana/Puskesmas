class RekamMediksController < ApplicationController
  before_action :set_rekam_medik, only: [:show, :edit, :update, :destroy]
    before_action :logged_in_user, only: [:new, :create, :update, :destroy, :index, :show, :edit]

    
  # GET /rekam_mediks
  # GET /rekam_mediks.json
  def index
    @rekam_mediks = RekamMedik.all
  end

  # GET /rekam_mediks/1
  # GET /rekam_mediks/1.json
  def show
  end

  # GET /rekam_mediks/new
  def new
    @rekam_medik = RekamMedik.new
  end

  # GET /rekam_mediks/1/edit
  def edit
  end

  # POST /rekam_mediks
  # POST /rekam_mediks.json
  def create
    @rekam_medik = RekamMedik.new(rekam_medik_params)

    respond_to do |format|
      if @rekam_medik.save
          format.html { redirect_to pasien_path(@rekam_medik.pasien), notice: 'Rekam medik was successfully created.' }
#          format.json { render :show, status: :created, location: @pasien}
      else
        format.html { render :new }
        format.json { render json: @rekam_medik.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rekam_mediks/1
  # PATCH/PUT /rekam_mediks/1.json
  def update
    respond_to do |format|
      if @rekam_medik.update(rekam_medik_params)
        format.html { redirect_to @rekam_medik, notice: 'Rekam medik was successfully updated.' }
        format.json { render :show, status: :ok, location: @rekam_medik }
      else
        format.html { render :edit }
        format.json { render json: @rekam_medik.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rekam_mediks/1
  # DELETE /rekam_mediks/1.json
  def destroy
    @rekam_medik.destroy
    respond_to do |format|
        format.html { redirect_to pasiens_url, notice: 'Rekam medik was successfully destroyed.' }
      format.json { head :no_content }
#        redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rekam_medik
      @rekam_medik = RekamMedik.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rekam_medik_params
        params.require(:rekam_medik).permit(:pasien_id, :nama, :keluhan, :penyakit_id, :terapi, :tindakan, :dokter_id)
    end
end

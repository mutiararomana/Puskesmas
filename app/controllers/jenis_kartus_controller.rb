class JenisKartusController < ApplicationController
  before_action :set_jenis_kartu, only: [:show, :edit, :update, :destroy]

  # GET /jenis_kartus
  # GET /jenis_kartus.json
  def index
    @jenis_kartus = JenisKartu.all
  end

  # GET /jenis_kartus/1
  # GET /jenis_kartus/1.json
  def show
  end

  # GET /jenis_kartus/new
  def new
    @jenis_kartu = JenisKartu.new
  end

  # GET /jenis_kartus/1/edit
  def edit
  end

  # POST /jenis_kartus
  # POST /jenis_kartus.json
  def create
    @jenis_kartu = JenisKartu.new(jenis_kartu_params)

    respond_to do |format|
      if @jenis_kartu.save
        format.html { redirect_to @jenis_kartu, notice: 'Jenis kartu was successfully created.' }
        format.json { render :show, status: :created, location: @jenis_kartu }
      else
        format.html { render :new }
        format.json { render json: @jenis_kartu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jenis_kartus/1
  # PATCH/PUT /jenis_kartus/1.json
  def update
    respond_to do |format|
      if @jenis_kartu.update(jenis_kartu_params)
        format.html { redirect_to @jenis_kartu, notice: 'Jenis kartu was successfully updated.' }
        format.json { render :show, status: :ok, location: @jenis_kartu }
      else
        format.html { render :edit }
        format.json { render json: @jenis_kartu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jenis_kartus/1
  # DELETE /jenis_kartus/1.json
  def destroy
    @jenis_kartu.destroy
    respond_to do |format|
      format.html { redirect_to jenis_kartus_url, notice: 'Jenis kartu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jenis_kartu
      @jenis_kartu = JenisKartu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jenis_kartu_params
      params.require(:jenis_kartu).permit(:nama)
    end
end

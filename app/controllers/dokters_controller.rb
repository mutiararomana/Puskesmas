class DoktersController < ApplicationController
  before_action :set_dokter, only: [:show, :edit, :update, :destroy]

  # GET /dokters
  # GET /dokters.json
  def index
    @dokters = Dokter.all
  end

  # GET /dokters/1
  # GET /dokters/1.json
  def show
  end

  # GET /dokters/new
  def new
    @dokter = Dokter.new
  end

  # GET /dokters/1/edit
  def edit
  end

  # POST /dokters
  # POST /dokters.json
  def create
    @dokter = Dokter.new(dokter_params)

    respond_to do |format|
      if @dokter.save
        format.html { redirect_to @dokter, notice: 'Dokter was successfully created.' }
        format.json { render :show, status: :created, location: @dokter }
      else
        format.html { render :new }
        format.json { render json: @dokter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dokters/1
  # PATCH/PUT /dokters/1.json
  def update
    respond_to do |format|
      if @dokter.update(dokter_params)
        format.html { redirect_to @dokter, notice: 'Dokter was successfully updated.' }
        format.json { render :show, status: :ok, location: @dokter }
      else
        format.html { render :edit }
        format.json { render json: @dokter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dokters/1
  # DELETE /dokters/1.json
  def destroy
    @dokter.destroy
    respond_to do |format|
      format.html { redirect_to dokters_url, notice: 'Dokter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dokter
      @dokter = Dokter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dokter_params
      params.require(:dokter).permit(:nama)
    end
end

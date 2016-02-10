class ObatsController < ApplicationController
  before_action :set_obat, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @obat, notice: 'Obat was successfully created.' }
        format.json { render :show, status: :created, location: @obat }
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

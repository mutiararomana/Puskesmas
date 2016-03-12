class TransaksiObatsController < ApplicationController
  before_action :set_transaksi_obat, only: [:show, :edit, :update, :destroy]

  # GET /transaksi_obats
  # GET /transaksi_obats.json
  def index
    @transaksi_obats = TransaksiObat.all
  end

  # GET /transaksi_obats/1
  # GET /transaksi_obats/1.json
  def show
  end

  # GET /transaksi_obats/new
  def new
    @transaksi_obat = TransaksiObat.new
  end

  # GET /transaksi_obats/1/edit
  def edit
  end

  # POST /transaksi_obats
  # POST /transaksi_obats.json
  def create
    @transaksi_obat = TransaksiObat.new(transaksi_obat_params)

    respond_to do |format|
      if @transaksi_obat.save
        format.html { redirect_to @transaksi_obat, notice: 'Transaksi obat was successfully created.' }
        format.json { render :show, status: :created, location: @transaksi_obat }
      else
        format.html { render :new }
        format.json { render json: @transaksi_obat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaksi_obats/1
  # PATCH/PUT /transaksi_obats/1.json
  def update
    respond_to do |format|
      if @transaksi_obat.update(transaksi_obat_params)
        format.html { redirect_to @transaksi_obat, notice: 'Transaksi obat was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaksi_obat }
      else
        format.html { render :edit }
        format.json { render json: @transaksi_obat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaksi_obats/1
  # DELETE /transaksi_obats/1.json
  def destroy
    @transaksi_obat.destroy
    respond_to do |format|
      format.html { redirect_to transaksi_obats_url, notice: 'Transaksi obat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaksi_obat
      @transaksi_obat = TransaksiObat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaksi_obat_params
      params.require(:transaksi_obat).permit(:obat_id, :jumlah_masuk, :jumlah_ambil, :penerimaan, :pemakaian)
    end
end

class ResepsController < ApplicationController
  before_action :set_resep, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  # GET /reseps
  # GET /reseps.json
  def index
      if params[:search_date]
          @reseps = Resep.by_day(params[:search_date])
#          time = Date.parse(params[:search_date])
#          @reseps = Resep.where(:created_at => (time.beginning_of_day..time.end_of_day))
        @reseps = @reseps.joins(:obat).select('*, sum(jumlah_ambil) as jumlah_ambil').group('obat_id')
      elsif params[:bulan]
          @reseps = Resep.by_month(params[:bulan], :year => params[:tahun])
          @reseps = @reseps.joins(:obat).select('*, sum(jumlah_ambil) as jumlah_ambil').group('obat_id')

      else
          @reseps = Resep.all
      end
  end
    
    def cetak_resep

        @reseps = Resep.by_month(params[:bulan], :year => params[:tahun])
#        time = Month.parse(params[:search_date])
#          @reseps = Resep.where(:created_at => (time.beginning_of_month..time.end_of_month))
#        @total_reseps = @reseps.group(:obat_id).sum(:jumlah_ambil)
        @total_reseps = @reseps.joins(:obat).select('*, sum(jumlah_ambil) as total').group('obat_id')
        
    end

  # GET /reseps/1
  # GET /reseps/1.json
  def show
  end

  # GET /reseps/new
  def new
    @resep = Resep.new
  end

  # GET /reseps/1/edit
  def edit
  end

  # POST /reseps
  # POST /reseps.json
  def create
    @resep = Resep.new(resep_params)

    respond_to do |format|
      if @resep.save
          format.html { redirect_to reseps_path, notice: 'Resep was successfully created.' }
#        format.json { render :show, status: :created, location: @resep }
      else
        format.html { render :new }
        format.json { render json: @resep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reseps/1
  # PATCH/PUT /reseps/1.json
  def update
    respond_to do |format|
      if @resep.update(resep_params)
        format.html { redirect_to @resep, notice: 'Resep was successfully updated.' }
        format.json { render :show, status: :ok, location: @resep }
      else
        format.html { render :edit }
        format.json { render json: @resep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reseps/1
  # DELETE /reseps/1.json
  def destroy
    @resep.destroy
    respond_to do |format|
      format.html { redirect_to reseps_url, notice: 'Resep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resep
      @resep = Resep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resep_params
        params.require(:resep).permit(:obat_id, :jumlah_ambil, :pemakaian)
    end
end

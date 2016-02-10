class PolisController < ApplicationController
  before_action :set_poli, only: [:show, :edit, :update, :destroy]

  # GET /polis
  # GET /polis.json
  def index
    @polis = Poli.all
  end

  # GET /polis/1
  # GET /polis/1.json
  def show
  end

  # GET /polis/new
  def new
    @poli = Poli.new
  end

  # GET /polis/1/edit
  def edit
  end

  # POST /polis
  # POST /polis.json
  def create
    @poli = Poli.new(poli_params)

    respond_to do |format|
      if @poli.save
        format.html { redirect_to @poli, notice: 'Poli was successfully created.' }
        format.json { render :show, status: :created, location: @poli }
      else
        format.html { render :new }
        format.json { render json: @poli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polis/1
  # PATCH/PUT /polis/1.json
  def update
    respond_to do |format|
      if @poli.update(poli_params)
        format.html { redirect_to @poli, notice: 'Poli was successfully updated.' }
        format.json { render :show, status: :ok, location: @poli }
      else
        format.html { render :edit }
        format.json { render json: @poli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polis/1
  # DELETE /polis/1.json
  def destroy
    @poli.destroy
    respond_to do |format|
      format.html { redirect_to polis_url, notice: 'Poli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poli
      @poli = Poli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poli_params
      params.require(:poli).permit(:nama)
    end
end

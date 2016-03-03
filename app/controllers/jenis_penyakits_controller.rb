class JenisPenyakitsController < ApplicationController
  before_action :set_jenis_penyakit, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  # GET /jenis_penyakits
  # GET /jenis_penyakits.json
  def index
    @jenis_penyakits = JenisPenyakit.all
  end

  # GET /jenis_penyakits/1
  # GET /jenis_penyakits/1.json
  def show
  end

  # GET /jenis_penyakits/new
  def new
    @jenis_penyakit = JenisPenyakit.new
  end

  # GET /jenis_penyakits/1/edit
  def edit
  end

  # POST /jenis_penyakits
  # POST /jenis_penyakits.json
  def create
    @jenis_penyakit = JenisPenyakit.new(jenis_penyakit_params)

    respond_to do |format|
      if @jenis_penyakit.save
        format.html { redirect_to @jenis_penyakit, notice: 'Jenis penyakit was successfully created.' }
        format.json { render :show, status: :created, location: @jenis_penyakit }
      else
        format.html { render :new }
        format.json { render json: @jenis_penyakit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jenis_penyakits/1
  # PATCH/PUT /jenis_penyakits/1.json
  def update
    respond_to do |format|
      if @jenis_penyakit.update(jenis_penyakit_params)
        format.html { redirect_to @jenis_penyakit, notice: 'Jenis penyakit was successfully updated.' }
        format.json { render :show, status: :ok, location: @jenis_penyakit }
      else
        format.html { render :edit }
        format.json { render json: @jenis_penyakit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jenis_penyakits/1
  # DELETE /jenis_penyakits/1.json
  def destroy
    @jenis_penyakit.destroy
    respond_to do |format|
      format.html { redirect_to jenis_penyakits_url, notice: 'Jenis penyakit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jenis_penyakit
      @jenis_penyakit = JenisPenyakit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jenis_penyakit_params
      params.require(:jenis_penyakit).permit(:nama)
    end
end

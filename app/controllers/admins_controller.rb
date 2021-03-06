class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
      @admin = Admin.find(params[:id])
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
      @admin = Admin.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
          log_in @admin
          format.html { redirect_to root_path, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end
    
  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
      @admin = Admin.find(params[:id])
      current_password = params[:current_password]
      if @admin.password = current_password
    respond_to do |format|
      if @admin.update(admin_params)
          format.html { redirect_to root_path, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
    else
        redirect_to edit_admin_path(@admin), allert: 'Current password does not match'
    end
      
      
#      @admin = User.new(admin_params)
#      if @admin.save
#          session[:user_id] = @admin.id
#      redirect_to root_url, notice: 'User was successfully created.'
#    else
#      render :new
#    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:username, :email, :password, :password_confirmation)
    end
    
end

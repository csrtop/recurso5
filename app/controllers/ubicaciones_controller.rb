class UbicacionesController < ApplicationController
  before_action :set_ubicacion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /ubicaciones
  # GET /ubicaciones.json
  def index
    @club = Club.find(params[:club_id])
    @ubicaciones = @club.ubicaciones

  end

  # GET /ubicaciones/1
  # GET /ubicaciones/1.json
  def show
  end

  # GET /ubicaciones/new
  def new
    @club = Club.find(params[:club_id])
    @ubicacion = @club.ubicaciones.new
  end

  # GET /ubicaciones/1/edit
  def edit
  end

  # POST /ubicaciones
  # POST /ubicaciones.json
  def create
    @club = Club.find(params[:club_id])
    @ubicacion = @club.ubicaciones.new(ubicacion_params)

    respond_to do |format|
      if @ubicacion.save
        format.html { redirect_to club_ubicaciones_path(@club), notice: 'Ubicacion was successfully created.' }
        format.json { render :show, status: :created, location: @ubicacion }
      else
        format.html { render :new }
        format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubicaciones/1
  # PATCH/PUT /ubicaciones/1.json
  def update
    respond_to do |format|
      if @ubicacion.update(ubicacion_params)
        format.html { redirect_to @ubicacion, notice: 'Ubicacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @ubicacion }
      else
        format.html { render :edit }
        format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicaciones/1
  # DELETE /ubicaciones/1.json
  def destroy
    @ubicacion.destroy
    respond_to do |format|
      format.html { redirect_to ubicaciones_url, notice: 'Ubicacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubicacion
      @ubicacion = Ubicacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ubicacion_params
      params.require(:ubicacion).permit(:club_id, :pedido_id)
    end
end

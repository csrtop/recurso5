class PosicionesController < ApplicationController
  before_action :set_posicion, only: [:show, :edit, :update, :destroy]

  # GET /posiciones
  # GET /posiciones.json
  def index
    @pedido = Pedido.find(params[:pedido_id])
    @posiciones = @pedido.posiciones.order("id")
  end

  # GET /posiciones/1
  # GET /posiciones/1.json
  def show
  end

  # GET /posiciones/new
  def new
    @pedido = Pedido.find(params[:pedido_id])
    @posicion = @pedido.posiciones.new

  end

  # GET /posiciones/1/edit
  def edit
  end

  # POST /posiciones
  # POST /posiciones.json
  def create
    @pedido = Pedido.find(params[:pedido_id])
    @posicion = @pedido.posiciones.new(posicion_params)

    respond_to do |format|
      if @posicion.save
        format.html { redirect_to pedidos_path, notice: 'Posicion was successfully created.' }
        format.json { render :show, status: :created, location: @posicion }
      else
        format.html { render :new }
        format.json { render json: @posicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posiciones/1
  # PATCH/PUT /posiciones/1.json
  def update
    respond_to do |format|
      if @posicion.update(posicion_params)
        format.html { redirect_to @posicion, notice: 'Posicion was successfully updated.' }
        format.json { render :show, status: :ok, location: @posicion }
      else
        format.html { render :edit }
        format.json { render json: @posicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posiciones/1
  # DELETE /posiciones/1.json
  def destroy
    @posicion.destroy
    respond_to do |format|
      format.html { redirect_to posiciones_url, notice: 'Posicion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posicion
      @posicion = Posicion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def posicion_params
      params.require(:posicion).permit(:pedido_id, :pasillo_id, :bahia_id)
    end
end

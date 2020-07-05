class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pedidos
  # GET /pedidos.json
  def index
    #@pedidos = Pedido.all
    @pedidos = Pedido.where("club_id=#{current_user.club_id} and ubicacion_id !=8").order('orden')
    
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to pedidos_path, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: pedidos_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #para subir csv
  #def import
    #Pedido.import(params[:file])
    #redirect_to pedidos_path, notice: "Pedidos Agregados Correctamente"
  #end
  #fin pedidos
  
  def import
    Pedido.import(params[:file])
    redirect_to pedidos_path, notice: "Pedidos Agregados Correctamente"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:orden, :OMS, :no_items, :socio, :fecha_orden, pictures: [])
      #params.require(:pedido).permit(:orden, :OMS, :no_items, :socio, :fecha_orden, :ubicacion_id, :tipo_entrega_id, :responsable_id, :club_id, pictures: [])
    end
end

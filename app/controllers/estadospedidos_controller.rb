class EstadospedidosController < ApplicationController
  before_action :set_estadopedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  #after_action :actualiza_estado, only: [:show, :update]
  # GET /estadospedidos
  # GET /estadospedidos.json
  def index
    @pedido = Pedido.find(params[:pedido_id])
    @estadospedidos = @pedido.estadospedidos.order("id")
    #@estadospedidos = Estadopedido.all
  end

  # GET /estadospedidos/1
  # GET /estadospedidos/1.json
  def show
  end

  # GET /estadospedidos/new
  def new
    @pedido = Pedido.find(params[:pedido_id])
    @estadopedido = @pedido.estadospedidos.new

    #@estadopedido = Estadopedido.new
  end

  # GET /estadospedidos/1/edit
  def edit
  end

  # POST /estadospedidos
  # POST /estadospedidos.json
  def create
    #@estadopedido = Estadopedido.new(estadopedido_params)
    @pedido = Pedido.find(params[:pedido_id])
    @estadopedido = @pedido.estadospedidos.new(estadopedido_params)
    
    respond_to do |format|
      if @estadopedido.save
        format.html { redirect_to pedido_estadospedidos_path(@pedido), notice: 'Estadopedido was successfully created.' }
        format.json { render :show, status: :created, location: @estadopedido }
      else
        format.html { render :new }
        format.json { render json: @estadopedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estadospedidos/1
  # PATCH/PUT /estadospedidos/1.json
  def update
    respond_to do |format|
      if @estadopedido.update(estadopedido_params)
        format.html { redirect_to @estadopedido, notice: 'Estadopedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @estadopedido }
      else
        format.html { render :edit }
        format.json { render json: @estadopedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estadospedidos/1
  # DELETE /estadospedidos/1.json
  def destroy
    @estadopedido.destroy
    respond_to do |format|
      format.html { redirect_to estadospedidos_url, notice: 'Estadopedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    #def actualiza_estado
     # puts "inicia callback"
     # Estadopedido.where("estadospedidos.pedido_id = pedidos.pedido_id")
     # puts "pedido id actualizado"
    #end

    def set_estadopedido
      @estadopedido = Estadopedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estadopedido_params
      params.require(:estadopedido).permit(:estado_id, :pedido_id)
    end
end

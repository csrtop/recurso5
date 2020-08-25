class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!
  # GET /pedidos
  # GET /pedidos.json
  def index
    #muestra solo los pedidos que no estan asignados
    @pedidos = Pedido.paginate(page: params[:page], per_page: 15).left_outer_joins(:responsables).where("pedidos.club_id=#{current_user.club_id} and pedidos.estado_id != 5 and responsables.pedido_id IS NULL")

    #muestra todos los pedidos aunque esten asignados
    #@pedidos = Pedido.paginate(page: params[:page], per_page: 15).where("club_id=#{current_user.club_id} and estado_id != 5").order('updated_at DESC')

    @contadorpedidos = Pedido.joins(:responsables).where("responsables.user_id = #{current_user.id} and pedidos.estado_id != 5").count
    #@contadorpedidos = Responsable.where("user_id=#{current_user.id}").count
    #puts "algo"+@contadorpedidos.to_s
    
    #cuenta vehiculos esperando a recibir productos
    @contadorvehiculos = Pedido.where("pedidos.club_id=#{current_user.club_id} and pedidos.estado_id = 7").count
    
    #cuenta si ya está ubicado un pedido
    #@contadorubicacion = Pedido.joins(:posiciones).where("pedidos.id = posiciones.pedido_id").count
    #puts "contadorubica"+@contadorubicacion.to_s
  end

  # Busqueda de pedidos
  def search
      @pedidos = Pedido.paginate(page: params[:page], per_page: 15).where("OMS LIKE ?","%" + params[:q] + "%")
  end

  def pedmanual
    @pedidos = Pedido.paginate(page: params[:page], per_page: 15).where("club_id=#{current_user.club_id} and no_items IS NULL").order('orden')

  end
  # GET /pedidos/1
  # GET /pedidos/1.json

  def mispedidos
    #muestra los pedidos asignados por usuario
    @pedidos = Pedido.joins(:responsables).where("responsables.user_id = #{current_user.id} and pedidos.estado_id != 5")
    
    
    #guarda usuario en variable
    #@userpedidos = current_user.id
    #puts 'user'+@userpedidos.to_s
    
  end

  def show
  end

  def pedidoscerrados
    @pedidos = Pedido.paginate(page: params[:page], per_page: 15).where("club_id=#{current_user.club_id} and estado_id = 5").order('orden')
  end

  def pedidosasignados
    #funciona
    #@pedidos = Responsable.joins(:pedido).where("pedidos.estado_id != 5").order('created_at DESC')
    
    @pedidos = Pedido.joins(:responsables).where("pedidos.club_id=#{current_user.club_id} and pedidos.estado_id != 5").order('responsables.user_id DESC')
  end

  def vehiculosenespera
    @pedidos = Pedido.where("pedidos.club_id=#{current_user.club_id} and pedidos.estado_id = 7").order('orden DESC')
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
    @pedido.estado_id = 5
    @pedido.club_id = current_user.club_id
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to pedidos_path, notice: 'Pedido was successfully created.' }
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
        format.html { redirect_to mispedidos_path, notice: 'Pedido was successfully updated.' }
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
  
  private

    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:orden, :OMS, :no_items, :socio, :fecha_orden, :club_id, :estado_id, :horallegada, pictures: [])
      #params.require(:pedido).permit(:orden, :OMS, :no_items, :socio, :fecha_orden, :ubicacion_id, :tipo_entrega_id, :responsable_id, :club_id, pictures: [])
    end
end
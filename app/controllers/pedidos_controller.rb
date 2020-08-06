class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!

  # GET /pedidos
  # GET /pedidos.json
  def index
    #@pedidos = Pedido.all
    #@pedidos = Pedido.where("club_id=#{current_user.club_id} and estado_id != 6").order('orden')
    #@pedidos = Pedido.paginate(page: params[:page])
    @pedidos = Pedido.paginate(page: params[:page], per_page: 15).where("club_id=#{current_user.club_id} and estado_id != 5").order('orden')
    #@pedidos = Pedido.where("club_id=#{current_user.club_id} and estado_id != 99").update_all('estado_id = @estadopedido.estado_id')
    @contadorpedidos = Responsable.where("user_id=#{current_user.id}").count
    #puts "algo"+@contadorpedidos.to_s
  end

  # Busqueda de pedidos
  def search
      @pedidos = Pedido.where("OMS LIKE ?","%" + params[:q] + "%")
  end

  def pedmanual
    @pedidos = Pedido.where("club_id=#{current_user.club_id} and no_items IS NULL").order('orden')
#    @pedidos = Pedido.where(:estados).where(estados: { no_estado: 1 })
    #@pedidos = Pedido.where("OMS LIKE ?","%" + params[:q] + "%")
  end
  # GET /pedidos/1
  # GET /pedidos/1.json

  def mispedidos
    #@pedidos = Responsable.where("user_id=#{current_user.id}").select("pedido.club_id=#{current_user.club_id}")
    #@pedidos = Pedido.joins("INNER JOIN responsables ON responsables.user_id = #{current_user}")
    #@pedidos = Pedido.where("club_id=#{current_user.club_id} and pedido.id = responsable.pedido_id").order('orden')
    
    #guarda usuario en variable
    #@userpedidos = current_user.id
    #puts 'user'+@userpedidos.to_s

    #@pedidos = Pedido.joins(:responsables).where('responsables.pedido_id = pedidos.id and responsables.user_id = @userpedidos')
    
    #funciona
    #@pedidos = Pedido.joins(:responsables).where("responsables.user_id = #{current_user.id} and responsables.pedido_id = pedidos.id")

    #muestra los pedidos asignados por usuario
    @pedidos = Pedido.joins(:responsables).where("responsables.user_id = #{current_user.id}")


    #(pedidos a, recurso5_development.responsables b
    #where b.pedido_id = a.id and b.club_id = a.club_id; 

    #@pedidos = Responsable.where("responsables.user_id = #{current_user.id}")
    #@pedidos = Pedido.where("pedido.id = @pedidos2") 
    #@pedidos = Pedido.joins(:responsables)
    
    #@pedidos = Pedido.where("@pedidos2 = @pedidos3")
    #raise @pedidos.to_s

    
    
    #.where('responsable.user_id = @userpedidos')
    #    @pedidos = Pedido.where("club_id=#{current_user.club_id}").Responsable.where("pedido.id = #{Responsable.pedido_id}")



    #@pedidos = Pedido.where("club_id=#{current_user.club_id} ")
    #@pedidos = Responsable.where("user_id=#{current_user.id}") and (Pedido.where("club_id=#{current_user.club_id}"))
    
    #@pedidos = Pedido.where("exists ( SELECT a.pedido_id, b.orden, b.OMS, b.no_items FROM responsables a, pedidos b where a.user_id = 1 and b.club_id = 4)")
    
  end

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
    @pedido.estado_id = 1
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
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:orden, :OMS, :no_items, :socio, :fecha_orden, :club_id, :estado_id, pictures: [])
      #params.require(:pedido).permit(:orden, :OMS, :no_items, :socio, :fecha_orden, :ubicacion_id, :tipo_entrega_id, :responsable_id, :club_id, pictures: [])
    end
end
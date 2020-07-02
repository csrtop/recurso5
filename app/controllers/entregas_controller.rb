class EntregasController < ApplicationController
  before_action :set_entrega, only: [:show, :edit, :update, :destroy]

  # GET /entregas
  # GET /entregas.json
  def index
    @pedido = Pedido.find(params[:pedido_id])
    @entregas = @pedido.entregas.order("id")
  end

  # GET /entregas/1
  # GET /entregas/1.json
  def show
#    @pedido = Pedido.find(params[:pedido_id])
    @entrega = Entrega.find(params[:entrega_id])
  end

  # GET /entregas/new
  def new
    @pedido = Pedido.find(params[:pedido_id])
    @entrega = @pedido.entregas.new
  end

  # GET /entregas/1/edit
  def edit
  end

  # POST /entregas
  # POST /entregas.json
  def create
    @pedido = Pedido.find(params[:pedido_id])
    @entrega = @pedido.entregas.new(entrega_params)

    respond_to do |format|
      if @entrega.save
        format.html { redirect_to pedido_entregas_path(@pedido), notice: 'Entrega was successfully created.' }
        format.json { render :show, status: :created, location: @entrega }
      else
        format.html { render :new }
        format.json { render json: @entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entregas/1
  # PATCH/PUT /entregas/1.json
  def update
    respond_to do |format|
      if @entrega.update(entrega_params)
        format.html { redirect_to @entrega, notice: 'Entrega was successfully updated.' }
        format.json { render :show, status: :ok, location: @entrega }
      else
        format.html { render :edit }
        format.json { render json: @entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entregas/1
  # DELETE /entregas/1.json
  def destroy
    @entrega.destroy
    respond_to do |format|
      format.html { redirect_to entregas_url, notice: 'Entrega was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrega
      @entrega = Entrega.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entrega_params
      params.require(:entrega).permit(:entregado, :fecha_entrega, :pedido_id, :image)
    end
end

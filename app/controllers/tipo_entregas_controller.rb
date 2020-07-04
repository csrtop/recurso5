class TipoEntregasController < ApplicationController
  before_action :set_tipo_entrega, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tipo_entregas
  # GET /tipo_entregas.json
  def index
    @tipo_entregas = TipoEntrega.all
  end

  # GET /tipo_entregas/1
  # GET /tipo_entregas/1.json
  def show
  end

  # GET /tipo_entregas/new
  def new
    @tipo_entrega = TipoEntrega.new
  end

  # GET /tipo_entregas/1/edit
  def edit
  end

  # POST /tipo_entregas
  # POST /tipo_entregas.json
  def create
    @tipo_entrega = TipoEntrega.new(tipo_entrega_params)

    respond_to do |format|
      if @tipo_entrega.save
        format.html { redirect_to @tipo_entrega, notice: 'Tipo entrega was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_entrega }
      else
        format.html { render :new }
        format.json { render json: @tipo_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_entregas/1
  # PATCH/PUT /tipo_entregas/1.json
  def update
    respond_to do |format|
      if @tipo_entrega.update(tipo_entrega_params)
        format.html { redirect_to @tipo_entrega, notice: 'Tipo entrega was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_entrega }
      else
        format.html { render :edit }
        format.json { render json: @tipo_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_entregas/1
  # DELETE /tipo_entregas/1.json
  def destroy
    @tipo_entrega.destroy
    respond_to do |format|
      format.html { redirect_to tipo_entregas_url, notice: 'Tipo entrega was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_entrega
      @tipo_entrega = TipoEntrega.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_entrega_params
      params.require(:tipo_entrega).permit(:entregado_por)
    end
end

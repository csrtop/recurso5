class ItemsImportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @items_import = ItemsImport.new
  end

  def create
    @items_import = ItemsImport.new(params[:items_import])
    if @items_import.save
      redirect_to pedidos_path
    else
      render :new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_items_imports
    @items_import = ItemsImport.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def items_imports_params
    params.require(:items_import).permit(:orden, :OMS, :no_items, :socio, :fecha_orden, :club_id, :estado_id)
    
  end
end
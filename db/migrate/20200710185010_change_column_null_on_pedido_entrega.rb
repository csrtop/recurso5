class ChangeColumnNullOnPedidoEntrega < ActiveRecord::Migration[6.0]
  def change
    change_column_null :pedidos, :estado_id, true
  end
end

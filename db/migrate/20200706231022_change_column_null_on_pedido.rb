class ChangeColumnNullOnPedido < ActiveRecord::Migration[6.0]
  def change
    change_column_null :pedidos, :ubicacion_id, true
    change_column_null :pedidos, :tipo_entrega_id, true
    change_column_null :pedidos, :responsable_id, true
    change_column_null :pedidos, :club_id, true
  end
end

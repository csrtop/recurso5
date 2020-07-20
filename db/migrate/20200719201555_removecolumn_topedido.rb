class RemovecolumnTopedido < ActiveRecord::Migration[6.0]
  def change
    remove_reference :pedidos, :tipo_entrega, index: true, foreign_key: true
    remove_reference :pedidos, :responsable, index: true, foreign_key: true
  end
end

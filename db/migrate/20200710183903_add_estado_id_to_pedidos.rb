class AddEstadoIdToPedidos < ActiveRecord::Migration[6.0]
  def change
    add_reference :pedidos, :estado, null: false, foreign_key: true
  end
end

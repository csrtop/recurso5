class RemoveEstadoIdToPedido < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:pedidos, :estado, index: true)
  end
end

class RemoveCamposIdToPedido < ActiveRecord::Migration[6.0]
  def change
    remove_column :pedidos, :fase_id
  end
end

class AddFaseIdToPedidos < ActiveRecord::Migration[6.0]
  def change
    add_reference :pedidos, :fase, null: false, foreign_key: true
  end
end

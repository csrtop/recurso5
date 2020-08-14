class AddHoraToPedidos < ActiveRecord::Migration[6.0]
  def change
    add_column :pedidos, :horallegada, :datetime, null: true
  end
end

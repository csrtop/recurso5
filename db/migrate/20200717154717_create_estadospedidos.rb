class CreateEstadospedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :estadospedidos do |t|
      t.references :estado, null: false, foreign_key: true
      t.references :pedido, null: false, foreign_key: true

      t.timestamps
    end
  end
end

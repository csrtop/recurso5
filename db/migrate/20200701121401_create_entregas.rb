class CreateEntregas < ActiveRecord::Migration[6.0]
  def change
    create_table :entregas do |t|
      t.boolean :entregado
      t.date :fecha_entrega
      t.references :pedido, null: false, foreign_key: true

      t.timestamps
    end
  end
end

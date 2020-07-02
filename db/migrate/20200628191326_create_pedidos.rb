class CreatePedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedidos do |t|
      t.integer :orden
      t.string :OMS
      t.integer :no_items
      t.string :socio
      t.date :fecha_orden
      t.references :ubicacion, null: false, foreign_key: true
      t.references :tipo_entrega, null: false, foreign_key: true
      t.references :responsable, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end

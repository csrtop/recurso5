class CreateUbicaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :ubicaciones do |t|
      t.references :club, null: false, foreign_key: true
      t.references :pedido, null: true, foreign_key: true

      t.timestamps
    end
  end
end

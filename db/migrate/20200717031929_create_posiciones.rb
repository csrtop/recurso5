class CreatePosiciones < ActiveRecord::Migration[6.0]
  def change
    create_table :posiciones do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :pasillo, null: false, foreign_key: true
      t.references :bahia, null: false, foreign_key: true

      t.timestamps
    end
  end
end

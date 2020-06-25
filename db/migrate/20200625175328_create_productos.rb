class CreateProductos < ActiveRecord::Migration[6.0]
  def change
    create_table :productos do |t|
      t.integer :item
      t.string :descripcion
      t.string :pasillo
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end

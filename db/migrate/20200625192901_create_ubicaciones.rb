class CreateUbicaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :ubicaciones do |t|
      t.string :ubicacion

      t.timestamps
    end
  end
end

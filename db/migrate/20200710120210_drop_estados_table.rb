class DropEstadosTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :estados
  end
end

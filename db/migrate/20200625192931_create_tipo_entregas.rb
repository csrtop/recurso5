class CreateTipoEntregas < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_entregas do |t|
      t.string :entregado_por

      t.timestamps
    end
  end
end

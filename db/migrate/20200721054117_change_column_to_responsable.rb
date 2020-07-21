class ChangeColumnToResponsable < ActiveRecord::Migration[6.0]
  def change
    rename_column :responsables, :responsable, :vehiculo
  end
end

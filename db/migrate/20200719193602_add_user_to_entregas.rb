class AddUserToEntregas < ActiveRecord::Migration[6.0]
  def change
    add_column :entregas, :entregadopor, :string
  end
end

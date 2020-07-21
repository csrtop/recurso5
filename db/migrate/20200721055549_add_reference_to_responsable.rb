class AddReferenceToResponsable < ActiveRecord::Migration[6.0]
  def change
    add_reference :responsables, :pedido, null: false, foreign_key: true
    add_reference :responsables, :user, null: false, foreign_key: true
  end
end

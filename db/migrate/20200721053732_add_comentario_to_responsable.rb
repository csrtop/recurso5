class AddComentarioToResponsable < ActiveRecord::Migration[6.0]
  def change
    add_column :responsables, :comentario, :text
  end
end

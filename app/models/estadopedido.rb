class Estadopedido < ApplicationRecord
  belongs_to :estado
  belongs_to :pedido
end

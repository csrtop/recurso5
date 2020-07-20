class Estado < ApplicationRecord
    has_many :pedidos
    has_many :estadospedidos
end

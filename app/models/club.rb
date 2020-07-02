class Club < ApplicationRecord
    has_many :productos
    has_many :responsables
    has_many :pedidos
end

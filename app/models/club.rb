class Club < ApplicationRecord
    has_many :productos
    has_many :responsables
    has_many :pedidos
    has_many :almacenes
    has_many :ubicaciones, :dependent => :destroy
end

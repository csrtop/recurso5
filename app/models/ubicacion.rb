class Ubicacion < ApplicationRecord
  belongs_to :club
  belongs_to :pedido
  has_many :pasillos
  has_many :bahias
end

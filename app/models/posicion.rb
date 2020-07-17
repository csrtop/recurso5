class Posicion < ApplicationRecord
  belongs_to :pedido
  belongs_to :pasillo
  belongs_to :bahia
end

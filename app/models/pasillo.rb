class Pasillo < ApplicationRecord
  belongs_to :club
  has_many :posiciones
end

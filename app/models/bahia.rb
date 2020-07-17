class Bahia < ApplicationRecord
  belongs_to :club
  has_many :posiciones
end

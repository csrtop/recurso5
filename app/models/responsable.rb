class Responsable < ApplicationRecord
  belongs_to :club
  belongs_to :pedido
  belongs_to :user
end

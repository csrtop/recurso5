class Club < ApplicationRecord
    has_many :productos
    has_many :responsables
end

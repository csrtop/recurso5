class Entrega < ApplicationRecord
  belongs_to :pedido
  #has_one_attached :pictures
  has_one_attached :picture
  has_one_attached :doc

  def thumbnail
    return self.picture.variant(resize:'500x300!').processed
  end
end

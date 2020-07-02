class Pedido < ApplicationRecord

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: "bom|utf-8") do |row|
      Pedido.create! row.to_hash
      end
    end
  belongs_to :ubicacion
  belongs_to :tipo_entrega
  belongs_to :responsable
  belongs_to :club
  has_many :entregas, :dependent => :destroy
  accepts_nested_attributes_for :entregas
end

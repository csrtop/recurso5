class Pedido < ApplicationRecord
  #validates_uniqueness_of :id, scope: :orden
  #  validates_presence_of :orden

  # def self.import(file)
  #   CSV.foreach(file.path, headers: true, encoding: "bom|utf-8") do |row|
  #     Pedido.create! row.to_hash
  #     end
  #   end
  
  belongs_to :estado
  has_many_attached :pictures
  #belongs_to :tipo_entrega
  #belongs_to :responsable
  belongs_to :club
  has_many :entregas, :dependent => :destroy
  has_many :responsables, :dependent => :destroy
  has_many :posiciones, :dependent => :destroy
  accepts_nested_attributes_for :entregas
  has_many :ubicaciones, :dependent => :destroy
  has_many :estadospedidos, :dependent => :destroy
  def thumbnail input
    return self.pictures[input].variant(resize: '300x300!').processed
  end
end

  #funciona con csv
  # def self.import(file)
  #   CSV.foreach(file.path, headers: true, encoding: "bom|utf-8") do |row|
  #     pedido_hash = row.to_hash
  #     pedido = Pedido.where(orden: pedido_hash["orden"])
      
  #     if pedido.count == 0
  #       Pedido.create!(pedido_hash)
  #     else
  #       #pedido.first.update_attributes(pedido_hash)
  #     end 
  #   end 
  # end 
  #fin csv


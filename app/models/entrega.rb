class Entrega < ApplicationRecord
  belongs_to :pedido

  has_many_attached :files
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  #pdf_preview: '600x600>'



  #fotos y pdf 
  #validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png', 'application/pdf']
  
  #documentos
  # has_attached_file :document, styles: { thumbnail: "60x60>" }
  # validates_attachment :document, content_type: { content_type: "application/pdf" }

after_save :guardar_foto

  def photo=(file_data)
    unless file_data.blank?
      @file_data = file_data
      self.extension = file_data.original_filename.split('.').last.downcase
      
    end
  end

  private

  def guardar_foto
    if @file_data
        FileUtils.mkdir_p FOTOS
        File.open(photo_filename, 'wb') do |f|
          f.write(@file_data.read)
        end
        @file_data = nil
      end
  end
end

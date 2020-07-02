class AddAttachmentImageToEntregas < ActiveRecord::Migration[4.2]
  def self.up
    change_table :entregas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :entregas, :image
  end
end

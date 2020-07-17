class CreatePasillos < ActiveRecord::Migration[6.0]
  def change
    create_table :pasillos do |t|
      t.string :pasillo
      t.references :club, null: true, foreign_key: true

      t.timestamps
    end
  end
end

class CreateBahias < ActiveRecord::Migration[6.0]
  def change
    create_table :bahias do |t|
      t.string :bahia
      t.references :club, null: true, foreign_key: true

      t.timestamps
    end
  end
end

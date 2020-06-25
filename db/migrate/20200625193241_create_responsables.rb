class CreateResponsables < ActiveRecord::Migration[6.0]
  def change
    create_table :responsables do |t|
      t.string :responsable
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateClubes < ActiveRecord::Migration[6.0]
  def change
    create_table :clubes do |t|
      t.integer :no_club
      t.string :nombre

      t.timestamps
    end
  end
end

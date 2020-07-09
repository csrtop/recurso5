class CreateFases < ActiveRecord::Migration[6.0]
  def change
    create_table :fases do |t|
      t.string :fase

      t.timestamps
    end
  end
end

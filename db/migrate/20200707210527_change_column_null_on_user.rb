class ChangeColumnNullOnUser < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :rol_id, true
    change_column_null :users, :club_id, true
  end
end

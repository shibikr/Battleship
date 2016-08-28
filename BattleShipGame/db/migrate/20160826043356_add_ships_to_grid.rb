class AddShipsToGrid < ActiveRecord::Migration
  def change
    add_reference :ships, :grid, index: true
  end
end

class AddGridToPlayer < ActiveRecord::Migration
  def change
    add_reference :grids, :player, index: true
  end
end

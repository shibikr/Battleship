class AddColumnsForPlayers < ActiveRecord::Migration
  def change
    add_column :players, :name, :text
    add_column :players, :hits, :string
    add_column :players, :misses, :string
    add_column :players, :ship_placed_points, :string
  end
end

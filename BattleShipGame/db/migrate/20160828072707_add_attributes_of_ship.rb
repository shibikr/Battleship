class AddAttributesOfShip < ActiveRecord::Migration
  def change
    add_column :ships, :type, :string
    add_column :ships, :size, :integer
    add_column :ships, :placed_points, :string
  end
end

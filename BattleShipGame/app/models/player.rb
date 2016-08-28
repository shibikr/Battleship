class Player < ActiveRecord::Base
  serialize :hits, Array
  serialize :misses, Array
  serialize :ship_placed_points, Array
  has_one :grid, dependent: :destroy
  has_many :ships, through: :grid
  belongs_to :game

  def is_hit?(point)
    self.ship_placed_points.include?(point)
  end

  def add_point_to_hits_and_misses(point)
    if is_hit?(point)
      self.hits << point
    else
      self.misses << point
    end
  end

  def add_ship_placed_points(ship)
    self.ship_placed_points.concat(ship.placed_points)
  end

end

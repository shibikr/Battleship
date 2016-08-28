class Ship < ActiveRecord::Base
  serialize :placed_points
  belongs_to :grid, dependent: :destroy

  module Alignment
    VERTICAL = 'vertical'
    HORIZONTAL = 'horizontal'
  end

  module Types
    CARRIER = 'carrier'
    BATTLESHIP = 'battleship'
    SUBMARINE = 'submarine'
    CRUISER = 'cruiser'
    DESTROYER = 'destroyer'
  end

  def self.ship_size(ship_type)
    { Ship::Types::CARRIER => 5,
      Ship::Types::BATTLESHIP => 4,
      Ship::Types::SUBMARINE => 3,
      Ship::Types::CRUISER => 3,
      Ship::Types::DESTROYER => 2
    }[ship_type]
  end

end

class Grid < ActiveRecord::Base
  has_many :ships, dependent: :destroy
  belongs_to :player

  def is_valid_point?(ship_size, starting_point, alignment)
    alphabet = starting_point[0]
    number = starting_point[1..-1].to_i
    if alignment == Ship::Alignment::VERTICAL
      can_align_vertically?(alphabet, ship_size)
    else
      can_align_horizontally?(number, ship_size)
    end
  end

  def place_ship(ship_size, starting_point, alignment)
    if is_valid_point?(ship_size, starting_point, alignment)
      alphabet = starting_point[0]
      number = starting_point[1..-1].to_i
      if alignment == Ship::Alignment::VERTICAL
        ship_points = place_ship_vertically(ship_size, alphabet, number)
      else
        ship_points = place_ship_horizontally(ship_size, alphabet, number)
      end
      ship_points << starting_point
    end
  end

  private

  def can_align_vertically?(alphabet, ship_size)
    if (alphabet.ord + (ship_size - 1)) <= 74
      true
    else
      false
    end
  end

  def can_align_horizontally?(number, ship_size)
    if (number + (ship_size - 1)) <= 10
      true
    else
      false
    end
  end

  def place_ship_vertically(ship_size, alphabet, number)
    ship_points = []
    (1..ship_size-1).each do |i|
      ascii = alphabet.ord + i
      ship_points << ((ascii.chr) + number.to_s)
    end
    ship_points
  end

  def place_ship_horizontally(ship_size, alphabet, number)
    ship_points = []
    (1..ship_size-1).each do |i|
      ship_points << (alphabet + (number + i).to_s)
    end
    ship_points
  end

end

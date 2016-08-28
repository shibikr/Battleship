require 'rails_helper'

RSpec.describe Grid, type: :model do
  context 'is_valid_point?' do
    it 'should return true if the point is valid to place the given ship with vertical alignment' do
      grid = Grid.create
      expect(grid.is_valid_point?(5, 'F6', Ship::Alignment::VERTICAL)).to be_truthy
    end

    it 'should return false if the point is not valid to place the given ship with vertical alignment' do
      grid = Grid.create
      expect(grid.is_valid_point?(5, 'G6', Ship::Alignment::VERTICAL)).to be_falsey
    end

    it 'should return true if the point is valid to place the given ship with horizontal alignment' do
      grid = Grid.create
      expect(grid.is_valid_point?(3, 'F6', Ship::Alignment::HORIZONTAL)).to be_truthy
    end

    it 'should return false if the point is not valid to place the given ship with horizontal alignment' do
      grid = Grid.create
      expect(grid.is_valid_point?(2, 'G10', Ship::Alignment::HORIZONTAL)).to be_falsey
    end
  end

  context 'place_ship' do
    it 'should return the valid points to place the ship in vertical alignment' do
      grid = Grid.create
      expect(grid.place_ship(5, 'F1', Ship::Alignment::VERTICAL)).to match_array(%w(F1 G1 H1 I1 J1))
    end

    it 'should return nil if the ship is not able to place in vertical alignment' do
      grid = Grid.create
      expect(grid.place_ship(3, 'I8', Ship::Alignment::VERTICAL)).to be_nil
    end

    it 'should return the valid points to place the ship in horizontal alignment' do
      grid = Grid.create
      expect(grid.place_ship(4, 'B7', Ship::Alignment::HORIZONTAL)).to match_array(%w(B7 B8 B9 B10))
    end

    it 'should return nil if the ship is not able to place in horizontal alignment' do
      grid = Grid.create
      expect(grid.place_ship(2, 'A10', Ship::Alignment::HORIZONTAL)).to be_nil
    end
  end

end

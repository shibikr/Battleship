require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'isHit?' do
    it 'should retrun true if the point is in ship placed points ' do
      player = Player.create(name: 'player',misses: [],hits: [],ship_placed_points: %w(H1 H2 H3))
      expect(player.is_hit?('H1')).to be_truthy
    end

    it 'should retrun false if the point is not in ship placed points ' do
      player = Player.create(name: 'player',misses: [],hits: [],ship_placed_points: %w(H1 H2 H3))
      expect(player.is_hit?('F1')).to be_falsey
    end
  end

  context 'add_point_to_hits_and_misses' do
    it 'should add the point to hits if the point is in ship placed points' do
      player = Player.create(name: 'player',misses: [],hits: [],ship_placed_points: %w(G1 G2 G3))
      player.add_point_to_hits_and_misses('G1')
      expect(player.hits.include?('G1')).to be_truthy
    end

    it 'should add the point to misses if the point is not in ship placed points' do
      player = Player.create(name: 'player',misses: [],hits: [],ship_placed_points: %w(G1 G2 G3))
      player.add_point_to_hits_and_misses('F1')
      expect(player.misses.include?('F1')).to be_truthy
    end
  end

  context 'add_points_to_ship_placed_points' do
    it 'should add placed points of given ship to player ' do
      ship = create(:ship, placed_points: ['A1', 'A2', 'A3'])
      player = create(:player)
      player.add_ship_placed_points(ship)
      expect(player.ship_placed_points).to match_array(['A1','A2','A3'])
    end
  end

end

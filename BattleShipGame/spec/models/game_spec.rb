require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @grid = create(:grid)
    @player1 = Player.create(name: 'player1', hits: [], misses: [], ship_placed_points: [])
    @player2 = Player.create(name: 'player2', hits: [], misses: [], ship_placed_points: [])
    @game = Game.create(players: [@player1, @player2])
  end

  context 'decide_winner' do
    it 'should return the player if any one of the player has won' do
      expect(@game.decide_winner).to eq(@player1)
    end
  end
end

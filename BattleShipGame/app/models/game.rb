class Game < ActiveRecord::Base
  has_many :players

  def decide_winner
    self.players.each do |player|
      return player if is_winner?(player)
    end
  end

  private

  def is_winner?(player)
    maximum_hit_points = 17
    if player.hits.ship_size == maximum_hit_points && (player.ship_placed_points == player.hits)
      true
    else
      false
    end
  end
end

class AddPlayersToGame < ActiveRecord::Migration
  def change
    add_reference :players, :game, index: true
  end
end

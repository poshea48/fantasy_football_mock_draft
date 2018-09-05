class DropMyPlayers < ActiveRecord::Migration[5.2]
  def change
    drop_table :my_players
  end
end

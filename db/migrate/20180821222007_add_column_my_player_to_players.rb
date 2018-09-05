class AddColumnMyPlayerToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :my_player, :boolean, default: false
  end
end

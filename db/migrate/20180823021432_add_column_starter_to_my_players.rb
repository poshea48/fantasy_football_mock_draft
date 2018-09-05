class AddColumnStarterToMyPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :my_players, :starter, :boolean, default: false
  end
end

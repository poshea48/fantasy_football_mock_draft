class AddColumnPositionToMyPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :my_players, :position, :string
  end
end

class CreateTableMyPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :my_players do |t|
      t.integer :player_id
      t.string :position
      t.string :round_drafted
      t.timestamps
    end
  end
end

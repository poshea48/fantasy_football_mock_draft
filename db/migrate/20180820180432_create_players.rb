class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :adp
      t.string :team
      t.string :position
      t.string :bye 
      t.timestamps
    end
  end
end

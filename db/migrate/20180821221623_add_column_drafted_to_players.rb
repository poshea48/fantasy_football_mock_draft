class AddColumnDraftedToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :drafted, :boolean, default: false
  end
end

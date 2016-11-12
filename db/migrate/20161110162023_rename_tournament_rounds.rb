class RenameTournamentRounds < ActiveRecord::Migration[5.0]
  def change
  rename_column :tournaments , :rounds, :no_of_rounds
  end
end

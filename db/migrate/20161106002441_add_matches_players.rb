class AddMatchesPlayers < ActiveRecord::Migration[5.0]
  def change
      create_table :matches_players,id:false do |t|
        t.belongs_to :player,index:true
        t.belongs_to :match,index:true
      end
  end
end

class AddRoundsMatches < ActiveRecord::Migration[5.0]
  def change
   create_table :rounds_matches,id:false do |t|
          t.belongs_to :round,index:true
          t.belongs_to :match,index:true
        end
  end
end

require 'test_helper'
require 'parking/schedule'
class ScheduleTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
     tm=TournamentModel.new(create_players,3)
     tm.schedule1
   end
   def create_players
        rishabh=PlayerModel.new("Rishabh Sinha",5)
        rohan=PlayerModel.new("Rohan",5)
        manya=PlayerModel.new("Manya",3)
        anway=PlayerModel.new("Anway",4)
        anirudh=PlayerModel.new("Anirudh",5)
        rohan1=PlayerModel.new("Rohan1",2)
        [rishabh,rohan,manya,anway,anirudh,rohan1]
   end
end

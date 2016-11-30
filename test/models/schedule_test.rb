require 'test_helper'
require 'parking/schedule'
class ScheduleTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
     tm=TournamentModel.new(create_players,1)
     puts "Master schedule=#{tm.splitandschedule}"
   end
   def create_players
        rishabh=PlayerModel.new("Rishabh Sinha",5)
        rohan=PlayerModel.new("Rohan",5)
        manya=PlayerModel.new("Manya",3)
        anway=PlayerModel.new("Anway",4)
        anirudh=PlayerModel.new("Anirudh",5)
        rohan1=PlayerModel.new("Rohan1",2)
        p1=PlayerModel.new("p1",3)
        p2=PlayerModel.new("p2",3)
        p3=PlayerModel.new("p3",3)
        p4=PlayerModel.new("p4",3)
        p5=PlayerModel.new("p5",3)
        p6=PlayerModel.new("p6",3)
        [rishabh,rohan,manya,anway,anirudh,rohan1,p1,p2,p3,p4,p5,p6]
   end
end

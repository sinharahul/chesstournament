require 'test_helper'
require 'parking/schedule'
class ScheduleTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
     tm=TournamentModel.new(create_players,3)
     tm.schedule
   end
   def create_players
        rishabh=PlayerModel.new("Rishabh Sinha",5)
        rohan=PlayerModel.new("Rohan",5)
        [rishabh,rohan]
   end
end

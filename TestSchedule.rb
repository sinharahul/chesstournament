require 'test/unit'
require 'schedule'
class TestSchedule < Test::Unit::TestCase
  def test_schedule
    player1=Player.new("Rishabh",4)
    player2=Player.new("Rohan",5)
    player3=Player.new("Anirudh",4)
    player4=Player.new("Anway",3)
    player5=Player.new("Manya",2)
    player6=Player.new("rohan1",2)
    players=[player1,player2,player3,player4,player5,player6]
    #players=[player3,player4]
    players.sort_by!{|p| -p.rating}
    players.each{|player| p player }
    t1=Tournament.new(players,3)
    t1.schedule
    puts "matches=#{t1.matches.length}"
    t1.matches().each do|match|
      puts "#{match.player1} V #{match.player2}"
    end
    assert_equal(15, t1.matches.length)
  end
end
require 'test_helper'

class TournamentTest < ActiveSupport::TestCase

  def setup
      @t=Tournament.new({name:"Tournament1",no_of_rounds:3})
      @t.save
      @round=Round.new({round_number:1})
      @round.tournament=@t
      @player1=Player.new(name:"Rishabh Sinha",rating:5)
      @player2=Player.new(name:"Anirudh",rating:5)
      @round.save
      @player1.save
      @player2.save
      @match=Match.new
      @match.save
      @match.players << @player1
      @match.players << @player2
      @round.matches << @match

      @round2=Round.new({round_number:2})
      @round2.tournament=@t
      @player3=Player.new(name:"Anway",rating:5)
      @player4=Player.new(name:"Julie",rating:5)
      @match1=Match.new
      @match1.players << @player1
      @match1.players << @player3
      @round2.matches << @match1
      @round2.save
=begin
      @player1=Player.new(name:"Rishabh Sinha",rating:5)
      @player2=Player.new(name:"Anirudh",rating:5)
      @match=Match.new
      #@match.players.insert(@player1)
      #@match.players.insert(@player2)
      #@round.matches.insert(@match)
=end
  end
    test "should be valid" do
      assert @t.valid?
    end
    test "Tournament should have 2 rounds" do
      assert @t.rounds.length==2
    end
end

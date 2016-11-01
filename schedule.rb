class Player
  attr_accessor :name,:rating
  def initialize(name,rating)
    @name=name
    @rating=rating
  end
  def to_s
    @name+":"+@rating.to_s
  end
  def ==(player)
        player!= nil && self.name == player.name 
  end
  
end

class Match
  attr_accessor :player1,:player2
  def initialize(player1,player2,play1score,play2score)
    @player1=player1
    @player2=player2
    @play1score=play1score
    @play2score=play2score
  end
  def ==(match)
    self.player1 != nil && self.player2 != nil &&  match.player1 !=nil && 
    match.player2 != nil && self.player1 == match.player1 && self.player2 == match.player2 ||
    (self.player1 == match.player2 && self.player2 == match.player1)
    
  end
  def to_s
    "Match"+player1.to_s+" "+player2.to_s
  end  
end  
class Tournament
  attr_accessor :players,:rounds,:matches
  def initialize(players,rounds)
    @players=players
    @rounds=rounds
    @matches=[]
  end
  def schedule
    count=@players.length
    matches=[]
    if count % 2==0
       1.upto(@rounds)do |round|
         puts "Scheduling #{round}" 
         pair(round)       
       end
    else
     puts "Number of players need to be even"
    end
  end 
  def pair(round)
    0.upto(@players.length-1)do|i|
      p1=@players[i]
      1.upto(@players.length-1)do|j|
        p2=@players[j]
         match=Match.new(p1,p2,0,0)
         puts match
        if not(p1 == p2) &&  !@matches.include?(match)
           @matches << match
           next
        end  
      end  
    end
  end
end

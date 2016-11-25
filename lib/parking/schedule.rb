=begin

=end
class PlayerModel
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

class MatchModel
  attr_accessor :player1,:player2,:round
  def initialize(player1,player2,play1score,play2score,round)
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
    "MatchModel"+player1.to_s+" "+player2.to_s+" "+round.to_s
  end  
end  
class TournamentModel
  attr_accessor :players,:rounds,:matches
  def initialize(players,rounds)
    @players=players
    @rounds=rounds
    @matches=[]
  end
=begin
  1)get all possible combinations of matches
  2)find all grouping of no_of_players/2(assuming even)
  3)filter out all groupings that contain the same player more than once
=end
  def schedule1
      rmmatches={}
     @matches=getmatches
     p @matches.length
     matchesperround=@players.length/2
     p matchesperround
     allcombinations=@matches.combination(matchesperround).to_a
     p allcombinations.first
     @matches=uniquematches(allcombinations)
     p @matches.length
      @matches=@matches.sort_by!{|m| (rank(m))}
      @matches=getunique(@matches)
     @matches=@matches.slice(0,@rounds)
     count=1
     @matches.each do|m|
       rmmatches[count]=m
       count=count+1
     end
     rmmatches
  end
  def getunique(matches)
    result=[]
    marray=[]

    matches.each do |m|
      flag=true
      marray.each do |ma|
        if m.include?(ma)
         flag=false
        end
      end

      if flag
        result << m
        m.each{|m1| marray << m1}
      end
    end
    result
  end
  def rank(matches)
    sum=0
    matches.each do |m|
      sum=sum+(m.player1.rating-m.player2.rating).abs
    end
    p "Sum=#{sum}"
    sum
  end
  def uniquematches(allcombinations)
     result=allcombinations.select do |elem|
        parray=[]
        elem.each do |e|
           parray << e.player1
           parray << e.player2
        end
        #p "parray=#{parray}"
        punique=parray.uniq
        #p "punique=#{punique}"
        parray.length==punique.length
     end
     result
  end
  def getmatches
    count=@players.length
    @players.sort_by!{|p| -p.rating}
    #@players.each{|player| p player }
    matches=[]
    0.upto(@players.length-1)do|i|
       p1=@players[i]

       0.upto(@players.length-1)do|j|
           p2=@players[j]
           match=MatchModel.new(p1,p2,0,0,0)
           if not(p1 == p2) &&   !matches.include?(match)
              matches << match
              #puts " #{match.player1.name} V #{match.player2.name}"
           end
       end
    end
    matches
  end
  def schedule
    count=@players.length
     @players.sort_by!{|p| -p.rating}
     @players.each{|player| p player }
    rmmatches={}
    if count % 2==0
       1.upto(@rounds)do |round|
         m=pair(round)
         rmmatches[round]=m
       end
    else
     puts "Number of players need to be even"
    end
    rmmatches
  end

  def pair(round)

     tplayers=[]
     roundmatches=[]
    0.upto(@players.length-1)do|i|
      p1=@players[i]
       0.upto(@players.length-1)do|j|
        p2=@players[j]
        match=MatchModel.new(p1,p2,0,0,round)
        if not(p1 == p2) &&  !@matches.include?(match) &&  !tplayers.include?(p1) &&  !tplayers.include?(p2)
           @matches << match
           roundmatches << match
           tplayers << p1
           tplayers << p2
           puts "Round:#{round} #{match.player1.name} V #{match.player2.name}"
        end
      end


    end
    roundmatches
  end
end

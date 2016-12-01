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
  1)max array size that is performant for array.combination method is 8
  2)anything over 8 split into 2 groups and schedule seperately and combine
=end
  def splitandschedule
    noofplayers=@players.length
    if noofplayers > 8
      splitville(noofplayers,@players,@rounds)
    else
     schedule1(@players,@rounds)
    end
  end
  def splitville(noofplayers,players,rounds)
    puts "hehehehe"
    result={}
    case
     when noofplayers % 10==0
       result=divideandconquer(10,noofplayers,players,rounds)
     when noofplayers % 8==0
            result=divideandconquer(8,noofplayers,players,rounds)
     when noofplayers % 6==0
            result=divideandconquer(6,noofplayers,players,rounds)
     when noofplayers % 14==0
              parts=noofplayers/14
              1.upto(parts) do |n|
                 result1=divideandconquer(8,8,players.slice(0,8),rounds)
                 result2=divideandconquer(6,6,players.slice(8,6),rounds)
                 resultn=combinehashes(result1,result2)
                 result=combinehashes(resultn,result)
              end
     else
         raise "cant handle #{noofplayers} players"
    end
    result
  end
 def divideandconquer(n,noofplayers,players,rounds)
   parts=noofplayers/n
   result={}
   count=0
   1.upto(parts) do|partn|
          puts partn
          part=players.slice(count,n*partn)
          #secondpart=players.slice(6,6)
          #h1=schedule1(firstpart,rounds)
          h=schedule1(part,rounds)
          p "h=#{h}"
          result=combinehashes(h,result)
          count=count+n
   end
  result
 end
 def combinehashes(h1,h2)
    result={}
    h1.each do |key, array|
     #p "key=#{key}"
     #p "array=#{array}"
     if h2[key] != nil
        #result[key]=array.concat(h2[key])
        result[key]=h2[key].concat(array)
     else
        result[key]=array
     end
     #p "result[key]=#{result[key]}"
    end
    result
  end
  def schedule2
    #arrange players in a hash rating=>[players]
    playershash=arrangeplayers
    p "playershash=#{playershash.sort.to_h}"
    sortedhash=playershash.sort.to_h
    matches=[]
    iter=100000
    n=@players.length/2
    #1.upto(@rounds) do |round|
    while matches.length < n*@rounds do
        p "In round #{@round}"
        roundplayers=@players
        1.upto(n)do |i|
          flag=false
          count=0
          while flag==false do
            rp1=roundplayers.sample
            rp2=roundplayers.sample
            if rp1==nil || rp2==nil
                p "Resetting"
                roundplayers=@players
                matches=[]
                flag=true
            end
            match=MatchModel.new(rp1,rp2,0,0,0)
            if !matches.include?(match)
               flag=true
               matches << match
               roundplayers.delete(rp1)
               roundplayers.delete(rp2)
            end
            count=count+1

          end
        end
    end
    # for i = 1 to number of rounds
    #choose player from highest rating , choose a random player from array
    #if already played choose from next rating category
    #
  end
  def arrangeplayers
    h={}
    @players.each do |player|
        if h[player.rating]==nil
            h[player.rating]=[player]
        else
           harray=h[player.rating]
           harray << player
        end
    end
    h
  end
=begin
  1)get all possible combinations of matches
  2)find all grouping of no_of_players/2(assuming even)
  3)filter out all groupings that contain the same player more than once
=end
  def schedule1(players,rounds)
      rmmatches={}
      matches=getmatches(players)

     p "matches length=#{matches.length}"
     matchesperround=players.length/2
     p "matchesperround=#{matchesperround}"
     allcombinations=matches.combination(matchesperround).to_a
     p "allcombinations.first=#{allcombinations.first}"
     matches=uniquematches(allcombinations)
     p matches.length
      matches=matches.sort_by!{|m| (rank(m))}
      matches=getunique(matches)
     matches=matches.slice(0,rounds)
     count=1
     matches.each do|m|
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
  def getmatches(players)
    count=players.length
    players.sort_by!{|p| -p.rating}
    #players.each{|player| p player }
    matches=[]
    0.upto(players.length-1)do|i|
       p1=players[i]

       (i+1).upto(players.length-1)do|j|
           p2=players[j]
           match=MatchModel.new(p1,p2,0,0,0)
           if not(p1 == p2) &&   !matches.include?(match)
              matches << match
              puts " #{match.player1.name} V #{match.player2.name}"
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

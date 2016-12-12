require 'schedule/schedulemodel'
class Scheduler
 def updateMatches(matches)
  matches.each do |key,array|
    p "match key=#{key} value=#{array[:result]}"
    mm=Match.find_by id:key
    r=array[:result]
    if r != nil
      mm.result=r
      mm.save
    end
  end
 end
 def process1(players,rounds,tournament)
      playerArray=[]
      puts players.length
      players.each do |key, array|
        puts "key=#{key}-----"
        puts array[:name],array[:rating]
        p=Player.find_by(id:key)
        #byebug
        if p==nil
          puts "Creating new player"
          p=Player.new
          p.name=array[:name]
          p.rating=array[:rating]
          #p.id=key
          puts "Creating new player #{p.name} #{p.rating}"
          p.save
        else
            puts "Find by key #{p}"
            p.name=array[:name]
            p.rating=array[:rating]
            p.save
            puts p

         end
         playerArray << p
      end
       if playerArray.length % 2 != 0
            dp=Player.find_by(name:"Bye...")
            puts "dp=#{dp}"
            if dp==nil
              dp=Player.new
              dp.name ="Bye..."
              dp.rating=2
              dp.save
            end

             playerArray  << dp
       end
      matches=convert(playerArray,rounds)
      save(matches,tournament)
      return playerArray
 end
 def save(matches,tournament)
  matches.each do |round, marray|
    puts "#{round}-----"
    puts marray
    saveround(round,marray,tournament)
  end
 end
 def saveround(round,marray,tournament)
    round=Round.new({round_number:round})
    round.tournament=tournament

   marray.each do|match|
     player1=Player.find_by name:match.player1.name
     player2=Player.find_by name:match.player2.name
     match=Match.new
     match.players << player1
     match.players << player2
     round.matches << match
   end
   round.save
 end
 def convert(players,rounds)
    playermodels=[]
    players.each do|player|
      pm=PlayerModel.new(player.name,player.rating)
      playermodels << pm
    end
    tm=TournamentModel.new(playermodels,rounds)
    matches=tm.splitandschedule
    puts "First round Matches=#{matches[1]}"
    puts "Second round Matches=#{matches[2]}"
    puts "Third round Matches=#{matches[3]}"
    matches
 end
end
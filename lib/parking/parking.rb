require 'parking/schedule'
class Parking
 def process1(players,rounds)
      playerArray=[]
      puts players.length
      players.each do |key, array|
        puts "#{key}-----"
        puts array[:name],array[:rating]
        p=Player.find(key)
        p.name=array[:name]
        p.rating=array[:rating]
        p.save
        puts p
        playerArray << p
      end
      convert(playerArray,rounds)
      return playerArray
 end
 def convert(players,rounds)
    playermodels=[]
    players.each do|player|
      pm=PlayerModel.new(player.name,player.rating)
      playermodels << pm
    end
    tm=TournamentModel.new(playermodels,rounds)
    matches=tm.schedule
    puts "First round Matches=#{matches[1]}"
    puts "Second round Matches=#{matches[2]}"
    puts "Third round Matches=#{matches[3]}"

 end
end
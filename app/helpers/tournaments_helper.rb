module TournamentsHelper
def getResult(result)
  case result
   when 1
    "White wins"
   when 2
    "Black Wins"
   when 3
    "Draw"
  end
  end
 def ranking(marray)
    if !allmatchescompleted(marray)
        return nil
    end
    playersscore={}
    marray.each do|match|
      player1=match.players[0]
      player2=match.players[1]
      case match.result
       when 1
         if playersscore[player1.name]==nil
           playersscore[player1.name]=1
         else
           playersscore[player1.name]=playersscore[player1.name]+1
         end
       when 2
             if playersscore[player2.name]==nil
                playersscore[player2.name]=1
              else
                playersscore[player2.name]=playersscore[player2.name]+1
             end
       when 3
             if playersscore[player2.name]==nil
                playersscore[player2.name]=0.5
             else
                playersscore[player2.name]=playersscore[player2.name]+0.5
             end
              if playersscore[player1.name]==nil
                playersscore[player1.name]=0.5
              else
                playersscore[player1.name]=playersscore[player1.name]+0.5
              end

      end
    end
    playersscore=playersscore.sort_by {|_key, value| -value}.to_h
 end
 def allmatchescompleted(marray)
    result=true
    marray.each do |m|
        if m.result==nil
            result=false
        end
    end

 end
end

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
end

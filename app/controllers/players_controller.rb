class PlayersController < ApplicationController
  def index
    @players=Player.all
  end
  def new
    @player=Player.new
  end
  def show
   @player=Player.find(params[:id])
  end
  def create
   @player=Player.new(player_params)
   if @player.save
     redirect_to @player
   else
     render new_player_path
   end
  end
  private
  def player_params
   params.require(:player).permit(:name, :rating)
  end
end

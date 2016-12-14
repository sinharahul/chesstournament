require 'schedule/schedule'
class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @tour = Tournament.find(params[:id])
    @rounds=@tour.rounds
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
    @players=Player.where("name != ?","Bye...")
  end

  # GET /tournaments/1/edit
  def edit

    @tournament = Tournament.find(params[:id])
    @players=Player.where("name != ?","Bye...")
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    puts "In create :params= #{params}"
    puts "In create :players= #{params[:players]}"
    puts "In create :no_of_rounds =#{params[:no_of_rounds]}"
    @players=params[:players]

    @rounds=params[:tournament][:no_of_rounds].to_i
    puts @players.length
    puts "rounds=#{@rounds}"
    @tournament = Tournament.new(tournament_params)
    scheduler=Scheduler.new
    scheduler.schedule_players(@players,@rounds,@tournament)

    puts "#{params}"
    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    matches=params[:matches]
    p "matches=#{matches}"
    scheduler=Scheduler.new
    scheduler.updateMatches(matches)
    respond_to do |format|
      if @tournament.update(update_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end
    def update_params
      params.require(:matches).permit(:id, :result,:matches)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :no_of_rounds,:players)
    end
end
